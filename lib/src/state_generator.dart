import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:fbloc_event_gen/src/event_generator.dart';
import 'package:source_gen/source_gen.dart';
import '../annotations.dart';

/// [StateGenerator] is the class which handles logic for Generating States Events and Blocs
class StateGenerator extends GeneratorForAnnotation<GenerateStates> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'GenerateState can only be applied to classes',
        element: element,
      );
    }

    final buffer = StringBuffer();
    final className = element.name.replaceFirst('_\$\$', '');

    final abstractClassRegex = RegExp(r"abstract class.*", dotAll: true);
    final match = abstractClassRegex.firstMatch(element.source.contents.data);
    List<String> fields = [];
    if (match != null) {
      String abstractClassContent = match.group(0)!;

      int firstBraceIndex = abstractClassContent
          .replaceAll(RegExp(r'\s+'), ' ')
          .trim()
          .indexOf('{');
      int lastBraceIndex = abstractClassContent
          .replaceAll(RegExp(r'\s+'), ' ')
          .trim()
          .lastIndexOf('}');
      String extractedContent = abstractClassContent
          .replaceAll(RegExp(r'\s+'), ' ')
          .trim()
          .substring(firstBraceIndex + 1, lastBraceIndex)
          .trim();

      // Step 2: Split the extracted content by every occurrence of ';' and include ';'
      List<String> splitStrings =
          extractedContent.split(';').map((e) => e.trim() + ';').toList();

      // Remove the trailing ';' from the last item (if any)
      if (splitStrings.isNotEmpty) {
        splitStrings[splitStrings.length - 1] =
            splitStrings.last.replaceAll(';', '');
      }

      //

      fields = splitStrings;
    } else {}

    List<VariableInfo> variableInfoList = [];

    // Process each string in the list
    for (int i = 0; i < fields.length - 1; i++) {
      String str = fields[i];

      // Step 1: Split the string into two parts: before and after '='
      int firstEquals = str.indexOf('=');
      String beforeEquals =
          firstEquals == -1 ? str.trim() : str.substring(0, firstEquals).trim();
      String afterEquals =
          firstEquals == -1 ? '' : str.substring(firstEquals + 1).trim();

      // Step 2: Split the part before '=' into parts according to space
      List<String> beforeParts = beforeEquals.split(' ');

      // Step 3: Remove the first element (e.g., "final")
      beforeParts.removeAt(0);

      // Step 4: Take the last element as the variableName
      String variableName = beforeParts.last;

      // Step 5: Join the remaining parts to form the dataType
      String dataType =
          beforeParts.sublist(0, beforeParts.length - 1).join(' ');

      // Step 6: Process the part after '='
      // Remove trailing space and ';' to get the defaultValue
      String defaultValue = afterEquals.replaceAll(';', '').trim();

      // Create a VariableInfo object and add it to the list
      VariableInfo variableInfo = VariableInfo(
        field: str,
        datatype: dataType,
        variableName: variableName,
        defaultValue: defaultValue,
      );
      variableInfoList.add(variableInfo);
    }

    String fieldParamsForGeneratedClass = variableInfoList.map((field) {
          return '''final ${field.datatype} ${field.variableName}''';
        }).join(";\n") +
        ";";

    String constructorParams = variableInfoList.map((field) {
      return field.datatype.endsWith('?')
          ? "this.${field.variableName}"
          : "required this.${field.variableName}";
    }).join(",\n      ");

    String initialStateValues = variableInfoList
        .map((field) {
          return "${field.variableName}: ${field.defaultValue}";
        })
        .where((line) => line.isNotEmpty)
        .join(",\n        ");
//Copy with section
    String copyWithParams = variableInfoList
        .map((field) {
          String type = field.datatype;
          String variableName = field.variableName;
          if (!type.endsWith("?")) {
            type += "?";
          }

          return '''
        $type $variableName''';
        })
        .where((line) => line.isNotEmpty)
        .join(",\n      ");

    String copyWithReturnFallbackParams = variableInfoList
        .map((field) {
          String variableName = field.variableName;

          return "$variableName: $variableName ?? this.$variableName";
        })
        .where((line) => line.isNotEmpty)
        .join(",\n        ");

// Copy With Null  Section
    String copyWithNullParams = variableInfoList
        .map((field) {
          String type = field.datatype;
          String variableName = field.variableName;
          if (type.endsWith("?")) {
            return '''
        bool $variableName = false''';
          } else {
            return '''
        $type? $variableName''';
          }
        })
        .where((line) => line.isNotEmpty)
        .join(",\n      ");

    String copyWithNullReturnFallbackParams = variableInfoList
        .map((field) {
          String variableName = field.variableName;

          String type = field.datatype;
          bool nullableType = type.endsWith('?');
          if (!nullableType) {
            return "$variableName: $variableName ?? this.$variableName";
          } else {
            return "$variableName: $variableName ? null : this.$variableName";
          }
        })
        .where((line) => line.isNotEmpty)
        .join(",\n        ");

    String propsList = variableInfoList
        .map((field) {
          return field.variableName;
        })
        .where((line) => line.isNotEmpty)
        .join(",\n        ");

    String setBlocStateParams = variableInfoList
        .map((field) {
          String type = field.datatype;
          String variableName = field.variableName;
          if (!type.endsWith("?")) {
            type += "?";
          }

          return "dynamic $variableName = UnspecifiedDataType.instance";
        })
        .where((line) => line.isNotEmpty)
        .join(",\n      ");

    String stateGeneratedEvents = variableInfoList.map((field) {
      String varName = field.variableName;

      return '''
class Update${capitalizeFirst(varName)}Event extends ${className.replaceAll('State', 'Event')} {
  final ${field.datatype} ${varName};
  const Update${capitalizeFirst(varName)}Event({required this.${varName}});

  @override
  List<Object?> get props => [${varName}];
}
''';
    }).join("\n");

    String registerEventsBody = variableInfoList.map((field) {
      String varName = field.variableName;
      String type = field.datatype;
      bool nullableType = type.endsWith('?');
      if (nullableType) {
        return '''
  bloc.on<Update${capitalizeFirst(varName)}Event>((event, emit) {
   if(event.$varName==null){
   emit(bloc.state.copyWithNull($varName:true)); 
   }else{
   emit(bloc.state.copyWith($varName: event.$varName)); 
   }
    
  });
''';
      } else {
        return '''
  bloc.on<Update${capitalizeFirst(varName)}Event>((event, emit) {
  
   emit(bloc.state.copyWith($varName: event.$varName)); 
 
    
  });
''';
      }
    }).join("\n");

    /// Get Cast Statement
    String getCastStatement(VariableInfo field) {
      final name = field.variableName;
      final type = field.datatype;

      final patterns = {
        'List<': 5,
        'Map<': 4,
        'Set<': 4,
        'Queue<': 6,
        'LinkedList<': 11,
        'DoubleLinkedQueue<': 18,
        'Iterable<': 9,
        'SplayTreeMap<': 13,
        'SplayTreeSet<': 13,
        'HashMap<': 7,
        'HashSet<': 7,
        'LinkedHashMap<': 13,
        'LinkedHashSet<': 13,
        'TreeMap<': 7,
        'TreeSet<': 7,
        'UnmodifiableListView<': 21,
        'UnmodifiableSetView<': 20,
        'UnmodifiableMapView<': 20,
      };

      for (final entry in patterns.entries) {
        final prefix = entry.key;
        final offset = entry.value;

        if (type.startsWith(prefix)) {
          final endsWithNullable = type.endsWith('?');
          final endIndex = type.length - (endsWithNullable ? 2 : 1);
          final innerType = type.substring(offset, endIndex);
          return '$name.cast<$innerType>()';
        }
      }

      return name + ' as $type';
    }

    String custumSetStateBlocImplementation = variableInfoList.map((field) {
      // Use a regex to extract the variable name properly

      String variableName = field.variableName;
      String castStatement = getCastStatement(field);

      return '''
if ($variableName != UnspecifiedDataType.instance) {
    
    myBloc.add(Update${capitalizeFirst(variableName)}Event($variableName: $castStatement));
}
''';
    }).join('\n');

    String blocSetStateName =
        'set${className.replaceAll("State", "Bloc")}State';

    /// Code generation Logic
    buffer.write('''
// Events Generated for corresponding states in State Class
$stateGeneratedEvents



/// A state class that represents the complete state of the '${className.replaceAll("State", "Bloc")}'.
/// This class is immutable and extends Equatable for value comparison.
class $className extends Equatable {

$fieldParamsForGeneratedClass

/// Creates a new instance of $className with the given parameters.
  const $className({
   $constructorParams
  });

  /// Creates the initial state of the '${className.replaceAll("State", "Bloc")}'.
  /// This method sets up default values for all state properties.
  static $className initial() {
    return $className(
      $initialStateValues
    );
  }


  /// Creates a copy of this state with the given parameters replaced.
  /// If a parameter is not provided, the value from the current state is used.
  $className copyWith({
  $copyWithParams
  }) {
    return $className(
       $copyWithReturnFallbackParams
    );
  }

  
  /// Creates a copy of this state with the ability to set specific fields to null.
  /// The boolean parameters control whether the corresponding field should be set to null.
  $className copyWithNull({
  $copyWithNullParams
  }) {
    return $className(
       $copyWithNullReturnFallbackParams
    );
  }

  /// Registers all event handlers for the '${className.replaceAll("State", "Bloc")}'.
  /// This method sets up the event-to-state mapping for all possible state updates.
  static void registerEvents(${className.replaceAll('State', 'Bloc')} bloc){
 
    $registerEventsBody
  
  }

  /// Returns a list of all properties used for equality comparison.
  @override
  List<Object?> get props => [
        $propsList
      ];
}



/// Extension on BuildContext that provides convenient methods for updating the '${className.replaceAll("State", "Bloc")}' state.
/// This extension simplifies state updates by providing a single method to update multiple state properties.
extension ${className.replaceAll('State', 'Bloc')}ContextExtension on BuildContext {
  /// Updates the '${className.replaceAll("State", "Bloc")}' state with the provided values.
  /// Only the specified parameters will be updated; others will remain unchanged.
  /// Uses UnspecifiedDataType.instance as a sentinel value to determine which parameters to update.
  void $blocSetStateName({
     $setBlocStateParams,
}) {
    final myBloc = read<${className.replaceAll('State', 'Bloc')}>();  // Read the MyBloc instance
     $custumSetStateBlocImplementation
  }
}



''');

    return buffer.toString();
  }
}

/// [VariableInfo] isused to spilt components ina state field
class VariableInfo {
  /// [field] carries complete field data
  final String field;

  /// [datatype] carries only datatype of the field
  final String datatype;

  /// [variableName] carries only variable name of field
  final String variableName;

  /// [defaultValue] carries onlu default value of the fiels
  final String defaultValue;

  /// Constructer used to Generate [VariableInfo] isused to spilt components ina state field
  VariableInfo({
    required this.field,
    required this.datatype,
    required this.variableName,
    required this.defaultValue,
  });

  @override
  String toString() {
    return "String: $field\nDatatype: $datatype\nVariable Name: $variableName\nDefault Value: $defaultValue\n-----------------------------";
  }
}

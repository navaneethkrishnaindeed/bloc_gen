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
      List<String> parts = str.split('=');
      String beforeEquals = parts[0].trim(); // Part before '='
      String afterEquals = parts[1].trim(); // Part after '='

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

    String copyWithParams = variableInfoList
        .map((field) {
          String type = field.datatype;
          String variableName = field.variableName;
          if (!type.endsWith("?")) {
            type += "?";
          }

          return '''
/// Data type [${field.datatype}] 
 Object? $variableName = UnspecifiedDataType.instance''';
        })
        .where((line) => line.isNotEmpty)
        .join(",\n      ");

    String setBlocStateParams = variableInfoList
        .map((field) {
          String type = field.datatype;
          String variableName = field.variableName;
          if (!type.endsWith("?")) {
            type += "?";
          }

          return "Object? $variableName = UnspecifiedDataType.instance";
        })
        .where((line) => line.isNotEmpty)
        .join(",\n      ");

    String copyWithReturnFallbackParams = variableInfoList
        .map((field) {
          String variableName = field.variableName;
          String type = field.datatype;
          return "$variableName: $variableName is UnspecifiedDataType ? this.$variableName : ($variableName as $type)";
        })
        .where((line) => line.isNotEmpty)
        .join(",\n        ");

    String propsList = variableInfoList
        .map((field) {
          return field.variableName;
        })
        .where((line) => line.isNotEmpty)
        .join(",\n        ");

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
      return '''
  bloc.on<Update${capitalizeFirst(varName)}Event>((event, emit) {
    emit(bloc.state.copyWith($varName: event.$varName)); 
  });
''';
    }).join("\n");

    String custumSetStateBlocImplementation = variableInfoList.map((field) {
      // Use a regex to extract the variable name properly

      String type = field.datatype;
      String variableName = field.variableName;

      return '''
if ($variableName != UnspecifiedDataType.instance) {
    myBloc.add(Update${capitalizeFirst(variableName)}Event($variableName: $variableName as $type));
}
''';
    }).join('\n');

    String blocSetStateName =
        'set${className.replaceAll("State", "Bloc")}State';

    buffer.write('''

$stateGeneratedEvents





class $className extends Equatable {
$fieldParamsForGeneratedClass

  const $className({
   $constructorParams
  });

  static $className initial() {
    return $className(
      $initialStateValues
    );
  }

  $className copyWith({
  $copyWithParams
  }) {
    return $className(
       $copyWithReturnFallbackParams
    );
  }
  static void registerEvents(${className.replaceAll('State', 'Bloc')} bloc){
 
    $registerEventsBody
  
  }

  @override
  List<Object?> get props => [
        $propsList
      ];
}




extension ${className.replaceAll('State', 'Bloc')}ContextExtension on BuildContext {
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

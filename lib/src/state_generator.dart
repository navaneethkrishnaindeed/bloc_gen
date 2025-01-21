import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import '../annotations.dart';

// class StateGenerator extends GeneratorForAnnotation<GenerateStates> {
//   @override
//   String generateForAnnotatedElement(
//     Element element,
//     ConstantReader annotation,
//     BuildStep buildStep,
//   ) {
//     if (element is! ClassElement) {
//       throw InvalidGenerationSourceError(
//         'generateStates can only be applied to classes',
//         element: element,
//       );
//     }

//     final buffer = StringBuffer();
//     final className = element.name;
//     final mixins = element.mixins;
//     final d = element.augmentationTarget;
//     final f = element.augmented;
//     final h = element.supertype;
//        final mixinRegex = RegExp(r'with\s+(_\$\w+)');
//     final match = mixinRegex.firstMatch(element.source.contents.data);

//     // print("Mixins : ${mixins}, augmentations : $d   ${f.declaration}..\n ${element.source.contents.data} \n ${match?.group(1)}");

//     // Process each factory constructor
//     for (final constructor in element.constructors) {
//       if (!constructor.isFactory) continue;

//       final eventName = constructor.name;
//       if (eventName.isEmpty) continue; // Skip unnamed factory constructors

//       // Get constructor parameters
//       final parameters = constructor.parameters;

//       // Generate field declarations
//       final fieldDeclarations = parameters.map((param) {
//         final type = param.type.getDisplayString(withNullability: true);
//         final name = param.name;
//         return '  final $type $name;';
//       }).join('\n');

//       final constructorParams = parameters.map((param) {
//         final name = param.name;
//         final requiredKeyword =
//             param.isRequired && param.isNamed ? 'required ' : '';
//         final namedParam = param.isNamed ? 'this.' : '';
//         return '$requiredKeyword$namedParam$name';
//       }).join(', ');

//       final hasNamedParameters = parameters.any((param) => param.isNamed);

//       final result = hasNamedParameters
//           ? ' ${capitalizeFirst(eventName)}({$constructorParams});'
//           : ' ${capitalizeFirst(eventName)}($constructorParams);';

//       // Generate props list for equatable
//       final propsList = parameters.map((param) => param.name).join(', ');

//       // Generate the event class
//       buffer.writeln('''
// mixin ${match?.group(1)} {
// $fieldDeclarations

//   $result

//   @override
//   List<Object?> get props => [$propsList];
// }

// ''');
// //  print('\n \n');
// //  print('\n fieldDeclarations \n');
// //  print(fieldDeclarations);
// //  print('\n constructorParams \n');
// //  print(constructorParams);
// //  print('\n propsList \n');
// //  print(propsList);

// //  print('\n *********************************************************************\n');
// //   print('\n \n');
//     }

//     // print('\n \n');

//     // print(buffer.toString());
//     return buffer.toString();
//   }
// }

// String capitalizeFirst(String input) {
//   if (input.isEmpty) return input; // Return if the string is empty
//   return input[0].toUpperCase() + input.substring(1);
// }

// //=====================================================================

// import 'package:analyzer/dart/element/element.dart';
// import 'package:build/build.dart';
// import 'package:source_gen/source_gen.dart';
// import '../annotations.dart';

// class StateGenerator extends GeneratorForAnnotation<GenerateStates> {
//   @override
//   String generateForAnnotatedElement(
//     Element element,
//     ConstantReader annotation,
//     BuildStep buildStep,
//   ) {
//     if (element is! ClassElement) {
//       throw InvalidGenerationSourceError(
//         'GenerateState can only be applied to classes',
//         element: element,
//       );
//     }

//     final buffer = StringBuffer();
//     final className = element.name.replaceFirst('_\$\$', '');

//     // Get all fields from the class
//     final fields = element.fields;

//     // Generate field declarations
//     final fieldDeclarations = fields.map((field) {
//       final type = field.type.getDisplayString(withNullability: true);
//       final name = field.name;
//       return 'final $type $name;';
//     }).join('\n  ');

//     // Generate constructor parameters
//     final constructorParams = fields.map((field) {
//       final name = field.name;
//       return 'required this.$name';
//     }).join(',\n      ');

//     // Generate initial state values - using the default values from the abstract class
//     final initialStateValues = fields.map((field) {
//       final name = field.name;
//       final defaultValue = field.computeConstantValue()?.toString() ??
//                          (field.type.isDartCoreBool ? 'false' : 'null');
//       return '$name: ${field.type.isDartCoreString ? '"$defaultValue"' : defaultValue}';
//     }).join(',\n        ');

//     // Generate copyWith parameters with proper nullability
//     final copyWithParams = fields.map((field) {
//       final type = field.type.getDisplayString(withNullability: true);
//       final name = field.name;
//       return '$type $name';
//     }).join(',\n      ');

//     buffer.write('''
// class $className extends Equatable {
//   $fieldDeclarations

//   const $className({
//       $constructorParams});

//   static $className initial() {
//     return $className(
//         $initialStateValues
//     );
//   }

//   $className copyWith({
//       $copyWithParams
//   }) {
//     return $className(
//         ${fields.map((field) => '${field.name}: ${field.name} ?? this.${field.name}').join(',\n        ')}
//     );
//   }

//   @override
//   List<Object?> get props => [
//         ${fields.map((field) => field.name).join(',\n        ')}
//       ];
// }
// ''');

//     return buffer.toString();
//   }
// }

//================================================================================

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
    print(element.source.contents.data);
    final abstractClassRegex = RegExp(r"abstract class.*", dotAll: true);
    final match = abstractClassRegex.firstMatch(element.source.contents.data);
    List<String> fields = [];
    if (match != null) {
      String abstractClassContent = match.group(0)!;

      // Define the regex for final fields
      final fieldRegex = RegExp(r"final\s+[\w<>\?]+\s+\w+\s*=\s*[^;]+;");

      // Find all matches for final fields
      fields = fieldRegex
          .allMatches(abstractClassContent)
          .map((m) => m.group(0)!)
          .toList();

      // Print the extracted fields

      print(fields);
    } else {
      print("No abstract class found.");
    }
    String fieldParamsForGeneratedClass = fields
            .map((field) {
              final match =
                  RegExp(r"(final\s+[\w<>\?]+\s+\w+)").firstMatch(field);
              return match != null ? match.group(0)! : "";
            })
            .where((line) => line.isNotEmpty) // Remove empty lines
            .join(";\n") +
        ";";

    String constructorParams = fields
        .map((field) {
          // Regex to capture type and variable name
          final match =
              RegExp(r"final\s+([\w<>\?]+)\s+(\w+)").firstMatch(field);
          if (match != null) {
            String type = match.group(1)!;
            String variableName = match.group(2)!;

            // Check if the type is nullable (contains '?')
            bool isNullable = type.contains("?");
            return isNullable
                ? "this.$variableName"
                : "required this.$variableName";
          }
          return "";
        })
        .where((line) => line.isNotEmpty) // Remove empty lines
        .join(",\n      ");
    String initialStateValues = fields
        .map((field) {
          // Regex to extract variable name and default value
          final match = RegExp(r"final\s+[\w<>\?]+\s+(\w+)\s*=\s*([^;]+);")
              .firstMatch(field);
          if (match != null) {
            String variableName = match.group(1)!; // Variable name
            String defaultValue = match.group(2)!; // Default value
            return "$variableName: $defaultValue";
          }
          return "";
        })
        .where((line) => line.isNotEmpty) // Remove empty lines
        .join(",\n        ");
    String copyWithParams = fields
      .map((field) {
        // Regex to extract type and variable name
        final match = RegExp(r"final\s+([\w<>\?]+)\s+(\w+)").firstMatch(field);
        if (match != null) {
          String type = match.group(1)!; // Type
          String variableName = match.group(2)!; // Variable name

          // Ensure the type is nullable
          if (!type.contains("?")) {
            type += "?";
          }

          return "$type $variableName";
        }
        return "";
      })
      .where((line) => line.isNotEmpty) // Remove empty lines
      .join(",\n      ");
    
    String copyWithReturnFallbackParams = fields
      .map((field) {
        // Regex to extract variable name
        final match = RegExp(r"final\s+[\w<>\?]+\s+(\w+)").firstMatch(field);
        if (match != null) {
          String variableName = match.group(1)!; // Variable name
          return "$variableName: $variableName ?? this.$variableName";
        }
        return "";
      })
      .where((line) => line.isNotEmpty) // Remove empty lines
      .join(",\n        ");

    String propsList = fields
      .map((field) {
        // Regex to extract variable name
        final match = RegExp(r"final\s+[\w<>\?]+\s+(\w+)").firstMatch(field);
        if (match != null) {
          return match.group(1)!;
        }
        return "";
      })
      .where((line) => line.isNotEmpty) // Remove empty lines
      .join(",\n        ");

    buffer.write('''
/*

*/
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

  @override
  List<Object?> get props => [
        $propsList
      ];
}
''');

    return buffer.toString();
  }
}

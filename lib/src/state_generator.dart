import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import '../annotations.dart';

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

      final fieldRegex = RegExp(r"final\s+[\w<>\?]+\s+\w+\s*=\s*[^;]+;");

      fields = fieldRegex
          .allMatches(abstractClassContent)
          .map((m) => m.group(0)!)
          .toList();

      
    } else {
      
    }
    
    String fieldParamsForGeneratedClass = fields
            .map((field) {
              final match =
                  RegExp(r"(final\s+[\w<>\?]+\s+\w+)").firstMatch(field);
              return match != null ? match.group(0)! : "";
            })
            .where((line) => line.isNotEmpty)
            .join(";\n") +
        ";";

    String constructorParams = fields
        .map((field) {
          final match =
              RegExp(r"final\s+([\w<>\?]+)\s+(\w+)").firstMatch(field);
          if (match != null) {
            String type = match.group(1)!;
            String variableName = match.group(2)!;

            bool isNullable = type.contains("?");
            return isNullable
                ? "this.$variableName"
                : "required this.$variableName";
          }
          return "";
        })
        .where((line) => line.isNotEmpty)
        .join(",\n      ");

    String initialStateValues = fields
        .map((field) {
          final match = RegExp(r"final\s+[\w<>\?]+\s+(\w+)\s*=\s*([^;]+);")
              .firstMatch(field);
          if (match != null) {
            String variableName = match.group(1)!;
            String defaultValue = match.group(2)!;
            return "$variableName: $defaultValue";
          }
          return "";
        })
        .where((line) => line.isNotEmpty)
        .join(",\n        ");

    String copyWithParams = fields
        .map((field) {
          final match =
              RegExp(r"final\s+([\w<>\?]+)\s+(\w+)").firstMatch(field);
          if (match != null) {
            String type = match.group(1)!;
            String variableName = match.group(2)!;

            if (!type.contains("?")) {
              type += "?";
            }

            return "$type $variableName";
          }
          return "";
        })
        .where((line) => line.isNotEmpty)
        .join(",\n      ");

    String copyWithReturnFallbackParams = fields
        .map((field) {
          final match = RegExp(r"final\s+[\w<>\?]+\s+(\w+)").firstMatch(field);
          if (match != null) {
            String variableName = match.group(1)!;
            return "$variableName: $variableName ?? this.$variableName";
          }
          return "";
        })
        .where((line) => line.isNotEmpty)
        .join(",\n        ");

    String propsList = fields
        .map((field) {
          final match = RegExp(r"final\s+[\w<>\?]+\s+(\w+)").firstMatch(field);
          if (match != null) {
            return match.group(1)!;
          }
          return "";
        })
        .where((line) => line.isNotEmpty)
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

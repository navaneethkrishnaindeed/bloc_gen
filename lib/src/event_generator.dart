import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import '../annotations.dart';

/// Class [EventGenerator] is Responcible for holding logic for creating custom events via factory constructors
class EventGenerator extends GeneratorForAnnotation<GenerateEvents> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'GenerateEvents can only be applied to classes',
        element: element,
      );
    }

    final buffer = StringBuffer();
    final className = element.name;

    // Process each factory constructor
    for (final constructor in element.constructors) {
      if (!constructor.isFactory) continue;

      final eventName = constructor.name;
      if (eventName.isEmpty) continue; // Skip unnamed factory constructors

      // Get constructor parameters
      final parameters = constructor.parameters;

      // Generate field declarations

      final fieldDeclarations = parameters.map((param) {
        final type = getTypeofPraram(param.toString());
        final name = param.name;
        return '  final $type $name;';
      }).join('\n');

      final constructorParams = parameters.map((param) {
        final name = param.name;
        final requiredKeyword =
            param.isRequired && param.isNamed ? 'required ' : '';
        final namedParam = param.isNamed ? 'this.' : '';
        return '$requiredKeyword$namedParam$name';
      }).join(', ');

      final hasNamedParameters = parameters.any((param) => param.isNamed);

      final result = hasNamedParameters
          ? 'const ${capitalizeFirst(eventName)}({$constructorParams});'
          : 'const ${capitalizeFirst(eventName)}($constructorParams);';

      // Generate props list for equatable
      final propsList = parameters.map((param) => param.name).join(', ');

      // Generate the event class
      buffer.writeln('''
class ${capitalizeFirst(eventName)} extends $className {
$fieldDeclarations

  $result

  @override
  List<Object?> get props => [$propsList];
}
''');
    }

    return buffer.toString();
  }
}

/// [capitalizeFirst] updates the First charecter of the String given and makes it Uppercase and returns the String
String capitalizeFirst(String input) {
  if (input.isEmpty) return input; // Return if the string is empty
  return input[0].toUpperCase() + input.substring(1);
}

/// [getTypeofPraram] is responcible for bifurcating params in to parts and return the return type alone as String
String getTypeofPraram(String inputStr) {
  // Remove { and }
  String cleanedStr = inputStr.replaceAll('{', '').replaceAll('}', '');

  // Split into parts
  List<String> parts = cleanedStr.split(' ');

  // Check if second to last element contains '?'
  return parts[parts.length - 2];
}

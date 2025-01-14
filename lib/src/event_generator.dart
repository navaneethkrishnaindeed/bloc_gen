import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import '../annotations.dart';

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
      if (eventName.isEmpty) continue;  // Skip unnamed factory constructors

      // Get constructor parameters
      final parameters = constructor.parameters;
      
      // Generate field declarations
      final fieldDeclarations = parameters.map((param) {
        final type = param.type.getDisplayString(withNullability: true);
        final name = param.name;
        return '  final $type $name;';
      }).join('\n');

      // Generate constructor parameters
      final constructorParams = parameters.map((param) {
        final type = param.type.getDisplayString(withNullability: true);
        final name = param.name;
        final requiredKeyword = param.isRequired ? 'required ' : '';
        final namedParam = param.isNamed ? 'this.' : '';
        return '${param.isNamed ? '{' : ''}$requiredKeyword$namedParam$name${param.isNamed ? '}' : ''}';
      }).join(', ');

      // Generate props list for equatable
      final propsList = parameters
          .map((param) => param.name)
          .join(', ');

      // Generate the event class
      buffer.writeln('''
class ${capitalizeFirst(eventName)} extends $className {
$fieldDeclarations

  const ${capitalizeFirst(eventName)}($constructorParams);

  @override
  List<Object?> get props => [$propsList];

 
}
''');
    }

    return buffer.toString();
  }
}

String capitalizeFirst(String input) {
  if (input.isEmpty) return input; // Return if the string is empty
  return input[0].toUpperCase() + input.substring(1);
}
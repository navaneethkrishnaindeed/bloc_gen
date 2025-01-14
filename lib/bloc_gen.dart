import 'package:bloc_gen/annotations.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'dart:async';

class EventGenerator extends GeneratorForAnnotation<GenerateEvents> {
  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
          'Generator can only be applied to classes.');
    }

    final classElement = element as ClassElement;
    final buffer = StringBuffer();

    for (final constructor in classElement.constructors) {
      if (!constructor.isFactory) continue;

      final factoryName = constructor.name;
      final className = classElement.name;

      // Generate fields for parameters
      final parameters = constructor.parameters;
      final fields = parameters.map((param) {
        final type = param.type.getDisplayString(withNullability: false);
        final name = param.name;
        final requiredModifier = param.isRequiredNamed ? 'required ' : '';
        return '$requiredModifier$type $name';
      }).join(', ');

      final fieldDeclarations = parameters.map((param) {
        final type = param.type.getDisplayString(withNullability: false);
        final name = param.name;
        return '  final $type $name;';
      }).join('\n');

      final propsList = parameters.map((param) => param.name).join(', ');

      // Generate class definition
      buffer.writeln('''
class $factoryName extends $className {
$fieldDeclarations

  const $factoryName({$fields});

  @override
  List<Object?> get props => [$propsList];
}
      ''');
    }

    return buffer.toString();
  }
}

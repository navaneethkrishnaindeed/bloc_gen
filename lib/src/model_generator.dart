// ignore_for_file: deprecated_member_use

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import '../annotations.dart';

/// [ModelGenerator] for creating CopyWith Extensions for Model Classes
class ModelGenerator extends GeneratorForAnnotation<GenerateModel> {
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
    final className = element.name;
    final copyWith = generateCopyWith(element.fields, element.name);
    buffer.write('''
extension ${className}CopyWithExtension on ${className}{
  $copyWith
}

''');

    return buffer.toString();
  }
}

/// [generateCopyWith] used to generate copyWithFunction

String generateCopyWith(List<FieldElement> fields, String className) {
  final newFields = fields.map((field) {
    final fieldStr = field.toString();
    final nullableField =
        fieldStr.contains('?') ? fieldStr : fieldStr.replaceFirst(' ', '? ');
    return '  $nullableField,';
  });
  return '''$className copyWith({
${newFields.join('\n')}
}) {
  return $className(
${newFields.map((field) {
    final fieldName =
        field.toString().split('?').last.trim().replaceAll(',', '');
    return '    $fieldName: $fieldName ?? this.$fieldName,';
  }).join('\n')}
  );
}''';
}

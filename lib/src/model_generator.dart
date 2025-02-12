import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:fbloc_event_gen/src/event_generator.dart';
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
    final copyWith = generateCopyWithFunction(element.source.contents.data);
    buffer.write('''
extension ${className}CopyWithExtension on ${className}{
  $copyWith
}

''');

    return buffer.toString();
  }
}

/// [generateCopyWithFunction] used to generate copyWithFunction
String generateCopyWithFunction(String classString) {
  final RegExp regExp = RegExp(r'\s*(\w+\??)\s+(\w+);');
  final RegExp constructorRegExp = RegExp(r'this\.(\w+)(?:\s*=\s*([^,}]+))?');

  final matches = regExp.allMatches(classString);
  final constructorMatches = constructorRegExp.allMatches(classString);

  Map<String, String> defaultValues = {};
  for (var match in constructorMatches) {
    String name = match.group(1)!;
    String? defaultValue = match.group(2);
    if (defaultValue != null) {
      defaultValues[name] = defaultValue.trim();
    }
  }

  List<String> parameters = [];
  List<String> assignments = [];

  for (var match in matches) {
    String type = match.group(1)!;
    String name = match.group(2)!;

    String nullableType = type.contains('?') ? type : '$type?';
    parameters.add('$nullableType $name');
    if (defaultValues.containsKey(name)) {
      assignments.add('$name: $name ?? this.$name');
    } else {
      assignments.add('$name: $name ?? this.$name');
    }
  }

  String copyWithFunction = '''
  AddCardRequestModel copyWith({
    ${parameters.join(',\n    ')}
  }) {
    return AddCardRequestModel(
      ${assignments.join(',\n      ')}
    );
  }
  ''';

  return copyWithFunction;
}

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import '../annotations.dart';

class EventGenerator extends GeneratorForAnnotation<GenerateEvent> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'GenerateEvent can only be applied to classes.',
        element: element,
      );
    }

    final className = element.name;
    final eventName = annotation.read('name').stringValue;
    
    return '''
    class ${eventName}Event extends $className {
      const ${eventName}Event();
      
      factory ${eventName}Event.fromJson(Map<String, dynamic> json) {
        return ${eventName}Event();
      }
      
      @override
      Map<String, dynamic> toJson() {
        return {
          'type': '$eventName',
          ...super.toJson(),
        };
      }
      
      @override
      String toString() => '${eventName}Event()';
    }
    ''';
  }
}
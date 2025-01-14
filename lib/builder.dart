import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'src/event_generator.dart';

Builder eventGenerator(BuilderOptions options) =>
    SharedPartBuilder([EventGenerator()], 'event_generator');
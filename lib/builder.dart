import 'package:bloc_gen/src/event_generator.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

Builder eventGenerator(BuilderOptions options) =>
    SharedPartBuilder([EventGenerator()], 'bloc_gen');

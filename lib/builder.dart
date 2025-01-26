import 'package:fbloc_event_gen/src/event_generator.dart';
import 'package:build/build.dart';
import 'package:fbloc_event_gen/src/state_generator.dart';
import 'package:source_gen/source_gen.dart';

/// Builder [eventGenerator] for Generating Events using factory constructors
Builder eventGenerator(BuilderOptions options) =>
    SharedPartBuilder([EventGenerator()], 'fbloc_event_gen');

/// Builder [stateGenerator] is for Generating States and Events and Blocs
Builder stateGenerator(BuilderOptions options) => SharedPartBuilder(
      [StateGenerator()],
      'fbloc_state_gen',
    );

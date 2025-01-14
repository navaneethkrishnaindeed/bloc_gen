import 'package:bloc_gen/bloc_gen.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'annotations.dart';

Builder subclassBuilder(BuilderOptions options) => SharedPartBuilder(
      [EventGenerator()],
      'event_generator',
    );

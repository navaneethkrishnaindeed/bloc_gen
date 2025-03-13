import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fbloc_event_gen/annotations.dart';
import 'package:equatable/equatable.dart';
part 'example_event.dart';
part 'example_state.dart';
part 'example_bloc.g.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(ExampleState.initial()) {
    ExampleState.registerEvents(this);
  }
}

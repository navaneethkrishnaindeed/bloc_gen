part of 'example_bloc.dart';

@generateEvents
abstract class ExampleEvent extends Equatable {
  const ExampleEvent();
  const factory ExampleEvent.updateIsLoadingGet(bool? isLoading) =
      UpdateIsLoadingGet;
}

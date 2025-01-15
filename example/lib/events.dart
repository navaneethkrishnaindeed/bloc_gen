import 'package:equatable/equatable.dart';
import 'package:bloc_event_gen/annotations.dart';

part 'events.g.dart';

@GenerateEvents()
abstract class BaseEvent extends Equatable {
  const BaseEvent();

  factory BaseEvent.userLoggedIn({required String userId}) = UserLoggedInEvent;
  factory BaseEvent.userLoggedOut() = UserLoggedOutEvent;
  factory BaseEvent.dataLoaded({required List<String> items}) = DataLoadedEvent;
}

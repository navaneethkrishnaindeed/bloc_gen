import 'package:event_generator/annotations.dart';
import 'package:equatable/equatable.dart';

part 'events.g.dart';
@GenerateEvents()
abstract class BaseEvent extends Equatable {
  const BaseEvent();

  factory BaseEvent.userLoggedIn({required String userId}) = UserLoggedInEvent;
  factory BaseEvent.userLoggedOut() = UserLoggedOutEvent;
  factory BaseEvent.dataLoaded({required List<String> items}) = DataLoadedEvent;
}
import 'package:equatable/equatable.dart';
import 'package:fbloc_event_gen/annotations.dart';

part 'events.g.dart';

@GenerateEvents()
abstract class BaseEvent extends Equatable {
  const BaseEvent();

  factory BaseEvent.userLoggedIn({required String userId,required String userIdde, bool? gfg}) = UserLoggedIn;
  factory BaseEvent.userLoggedOut() = UserLoggedOut;
  factory BaseEvent.dataLoaded({required List<String> items}) = DataLoaded;
}

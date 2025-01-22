part of 'main.dart';

@generateEvents
abstract class BaseEvent extends Equatable {
  const BaseEvent();

  factory BaseEvent.userLoggedIn(
      {required String userId,
      required String userIdde,
      bool? gfg}) = UserLoggedIn;
  factory BaseEvent.userLoggedOut() = UserLoggedOut;
  factory BaseEvent.dataLoaded({required List<String> items}) = DataLoaded;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// EventGenerator
// **************************************************************************

class UserLoggedInEvent extends BaseEvent {
   UserLoggedInEvent();

  factory UserLoggedInEvent.fromJson(Map<String, dynamic> json) {
    return UserLoggedInEvent();
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'UserLoggedIn',
      ...super.toJson(),
    };
  }

  @override
  String toString() => 'UserLoggedInEvent()';
}

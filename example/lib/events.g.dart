// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// EventGenerator
// **************************************************************************

class userLoggedInEvent extends BaseEvent {
  final String userId;

  const userLoggedInEvent({required this.userId});

  @override
  List<Object?> get props => [userId];

  @override
  String toString() => 'userLoggedInEvent(userId: $userId)';
}

class userLoggedOutEvent extends BaseEvent {
  const userLoggedOutEvent();

  @override
  List<Object?> get props => [];

  @override
  String toString() => 'userLoggedOutEvent()';
}

class dataLoadedEvent extends BaseEvent {
  final List<String> items;

  const dataLoadedEvent({required this.items});

  @override
  List<Object?> get props => [items];

  @override
  String toString() => 'dataLoadedEvent(items: $items)';
}

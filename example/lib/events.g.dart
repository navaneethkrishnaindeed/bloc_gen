// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// EventGenerator
// **************************************************************************

class UserLoggedInEvent extends BaseEvent {
  final String userId;

  UserLoggedInEvent({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class UserLoggedOutEvent extends BaseEvent {
  UserLoggedOutEvent();

  @override
  List<Object?> get props => [];
}

class DataLoadedEvent extends BaseEvent {
  final List<String> items;

  DataLoadedEvent({required this.items});

  @override
  List<Object?> get props => [items];
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// EventGenerator
// **************************************************************************

class UserLoggedIn extends BaseEvent {
  final String userId;
  final String userIdde;
  final bool? gfg;

  const UserLoggedIn({required this.userId, required this.userIdde, this.gfg});

  @override
  List<Object?> get props => [userId, userIdde, gfg];
}

class UserLoggedOut extends BaseEvent {
  const UserLoggedOut();

  @override
  List<Object?> get props => [];
}

class DataLoaded extends BaseEvent {
  final List<String> items;

  const DataLoaded({required this.items});

  @override
  List<Object?> get props => [items];
}

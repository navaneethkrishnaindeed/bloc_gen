# Flutter Bloc Event Generator

A Dart package that automatically generates event classes from factory constructors. This package helps reduce boilerplate code when working with event-driven architectures, particularly useful in BLoC pattern implementations.

## Features

- Automatically generates event classes from factory constructors
- Supports both named and positional parameters
- Integrates with Equatable for value comparison
- Generates proper props list for each event
- Supports nullable types
- Type-safe event generation

## Installation

Add these dependencies to your `pubspec.yaml`:

```yaml
dependencies:
  fbloc_event_gen: ^1.0.0
  equatable: ^2.0.7

dev_dependencies:
  build_runner: ^2.4.6
```

## Usage

### Basic Setup

1. Create your base event class with factory constructors:

```dart
import 'package:fbloc_event_gen/annotations.dart';
import 'package:equatable/equatable.dart';

part 'events.g.dart';

@GenerateEvents()
abstract class BaseEvent extends Equatable {
  const BaseEvent();

  factory BaseEvent.userLoggedIn({required String userId}) = UserLoggedInEvent;
  factory BaseEvent.userLoggedOut() = UserLoggedOutEvent;
  factory BaseEvent.dataLoaded({required List<String> items}) = DataLoadedEvent;
}
```

2. Run the generator:

```bash
dart run build_runner build
```

### Generated Code

For the above example, the following classes will be generated:

```dart
class UserLoggedInEvent extends BaseEvent {
  final String userId;
  
  const UserLoggedInEvent({required this.userId});
  
  @override
  List<Object?> get props => [userId];
  
  @override
  String toString() => 'UserLoggedInEvent(userId: $userId)';
}

class UserLoggedOutEvent extends BaseEvent {
  const UserLoggedOutEvent();
  
  @override
  List<Object?> get props => [];
  
  @override
  String toString() => 'UserLoggedOutEvent()';
}

class DataLoadedEvent extends BaseEvent {
  final List<String> items;
  
  const DataLoadedEvent({required this.items});
  
  @override
  List<Object?> get props => [items];
  
  @override
  String toString() => 'DataLoadedEvent(items: $items)';
}
```

### Using Generated Events

```dart
void main() {
  // Using named constructor syntax
  final loginEvent = BaseEvent.userLoggedIn(userId: '123');
  final logoutEvent = BaseEvent.userLoggedOut();
  final dataEvent = BaseEvent.dataLoaded(items: ['item1', 'item2']);

  // Events are Equatable
  print(loginEvent == BaseEvent.userLoggedIn(userId: '123')); // true
  
  // toString() is implemented
  print(loginEvent); // UserLoggedInEvent(userId: 123)
}
```

## Advanced Usage

### Custom Event Properties

You can add any number of properties to your events:

```dart
@GenerateEvents()
abstract class BaseEvent extends Equatable {
  const BaseEvent();

  factory BaseEvent.userAction({
    required String userId,
    required String action,
    DateTime? timestamp,
    Map<String, dynamic>? metadata,
  }) = UserActionEvent;
}
```

### Working with Bloc Pattern

The generated events work seamlessly with the bloc pattern:

```dart
class UserBloc extends Bloc<BaseEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserLoggedInEvent>((event, emit) {
      // Handle login with event.userId
    });

    on<UserLoggedOutEvent>((event, emit) {
      // Handle logout
    });
  }
}
```

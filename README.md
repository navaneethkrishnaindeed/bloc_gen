# Flutter Bloc State Management Code Generator

A powerful code generation package that simplifies Flutter Bloc pattern implementation by automatically generating events, states, and utility methods from a single abstract class definition.

## Overview

This package reduces boilerplate code in Flutter Bloc implementations by generating:
- Individual events for each state variable
- Complete state class with immutability support
- Event registration methods for Bloc classes
- BuildContext extensions for simplified state updates

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  fbloc_event_gen: ^3.0.0

dev_dependencies:
  build_runner: ^2.4.6
```

## Usage

### 1. Define Your State Class

Create an abstract class with the prefix `_$$` and define your state variables with their initial values:

```dart
abstract class _$$BaseState {
  final bool active = false;
  final bool? isLoading = false;
  final List<String>? errorMessages = [];
  // ... other state variables
}
```

### 2. Run Code Generation

Execute the following command to generate the code:

```bash
dart run build_runner build -d
```

### 3. Generated Code Components

#### Events
For each state variable, an event class is generated:

```dart
class UpdateActiveEvent extends BaseEvent {
  final bool active;
  const UpdateActiveEvent({required this.active});

  @override
  List<Object?> get props => [active];
}
```

#### State Class
A complete state class is generated with:

- Constructor with required/optional parameters
- Initial state factory method
- CopyWith method for immutable updates
- Equatable implementation
- Event registration method

```dart
class BaseState extends Equatable {
  final bool active;
  // ... other fields

  const BaseState({required this.active, ...});

  static BaseState initial() {
    return BaseState(active: false, ...);
  }

  BaseState copyWith({bool? active, ...}) {
    return BaseState(active: active ?? this.active, ...);
  }

  static void registerEvents(BaseBloc bloc) {
    bloc.on<UpdateActiveEvent>((event, emit) {
      emit(bloc.state.copyWith(active: event.active));
    });
    // ... other event handlers
  }

  @override
  List<Object?> get props => [active, ...];
}
```

#### BuildContext Extension
A convenient extension method is generated for simpler state updates:

```dart
extension BaseBlocContextExtension on BuildContext {
  void setBaseBlocState({
    bool? active,
    // ... other parameters
  }) {
    final myBloc = read<BaseBloc>();
    if (active != null) {
      myBloc.add(UpdateActiveEvent(active: active));
    }
    // ... other event dispatches
  }
}
```

### 4. Using the Generated Code

#### In Your Bloc Class

```dart
class BaseBloc extends Bloc<BaseEvent, BaseState> {
  BaseBloc() : super(BaseState.initial()) {
    // Register all event handlers
    BaseState.registerEvents(this);
  }
}
```

#### Updating State in Widgets

```dart
// Traditional way
context.read<BaseBloc>().add(UpdateActiveEvent(active: true));

// Using generated extension method
context.setBaseBlocState(
  active: true,
  isLoading: false,
);
```

## Features

1. **Automatic Event Generation**
   - Creates type-safe events for each state variable
   - Implements Equatable for proper comparison

2. **State Management**
   - Generates immutable state class
   - Includes copyWith method for state updates
   - Implements Equatable for state comparison
   - Provides initial state factory method

3. **Event Registration**
   - Generates event handler registration method
   - Automatically implements state updates for each event

4. **BuildContext Extensions**
   - Provides simplified state update methods
   - Handles null checking automatically
   - Reduces boilerplate in widget code

## Benefits

- **Reduced Boilerplate**: Eliminates repetitive code writing
- **Type Safety**: Ensures type-safe state updates
- **Maintainability**: Centralizes state definition
- **Consistency**: Enforces consistent patterns
- **Developer Experience**: Simplifies state updates in widgets

## Limitations

- Requires abstract class name to start with `_$$`
- Initial values must be specified in the abstract class
- Generated code should not be modified manually

## Best Practices

1. Keep state variables focused and minimal
2. Use meaningful variable names
3. Group related states in separate state classes
4. Run code generation after each state class update
5. Commit generated files to version control

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
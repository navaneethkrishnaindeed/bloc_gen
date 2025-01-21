# Flutter Bloc Generators

A powerful code generation package for Flutter Bloc pattern that reduces boilerplate code by automatically generating event and state classes. This package provides two main generators:
- `EventGenerator`: Automatically generates event classes from factory constructors
- `StateGenerator`: Creates immutable state classes with built-in `copyWith` functionality

## Features

✨ **Event Generator**
- Automatic event class generation from factory constructors
- Support for named and positional parameters
- Proper nullability handling
- Automatic Equatable implementation
- Const constructor generation

🎯 **State Generator**
- Immutable state class generation
- Automatic `copyWith` method generation
- Default value preservation
- Built-in Equatable implementation
- Support for complex types and nullability

## Installation

Add these dependencies to your `pubspec.yaml`:

```yaml
dependencies:

  fbloc_event_gen:
    git:
      url: [https://github.com/naveen-as-a-geek-wolf/bloc_gen]
      ref: main


```

## Getting Started

### Basic Setup

1. Create a new file structure for your bloc:

```
lib/
  ├── blocs/
  │   └── my_feature/
  │       ├── main.dart // You can replace this with your Bloc File
  │       ├── events.dart
  │       ├── state.dart
  │       └── main.g.dart (generated)
```

2. Set up your `main.dart`:

```dart
import 'package:equatable/equatable.dart';
import 'package:fbloc_event_gen/annotations.dart';

part 'state.dart';
part 'events.dart';
part 'main.g.dart';
```

### Generating Events

1. Create your events file (`events.dart`):

```dart
part of 'main.dart';

@generateEvents
abstract class BaseEvent extends Equatable {
  const BaseEvent();

  // Simple event without parameters
  factory BaseEvent.initialize() = Initialize;
  
  // Event with required parameters
  factory BaseEvent.userLoggedIn({
    required String userId,
    required String username,
  }) = UserLoggedIn;
  
  // Event with optional parameters
  factory BaseEvent.updateSettings({
    String? theme,
    bool? notificationsEnabled,
  }) = UpdateSettings;
  
  // Event with mixed parameter types
  factory BaseEvent.dataLoaded(
    List<String> items, {
    required bool isSuccess,
    String? errorMessage,
  }) = DataLoaded;
}
```

This will generate:

```dart
// In main.g.dart
class Initialize extends BaseEvent {
  const Initialize();

  @override
  List<Object?> get props => [];
}

class UserLoggedIn extends BaseEvent {
  final String userId;
  final String username;

  const UserLoggedIn({
    required this.userId,
    required this.username,
  });

  @override
  List<Object?> get props => [userId, username];
}

// ... other event classes
```

### Generating States

1. Create your state file (`state.dart`):

```dart
part of 'main.dart';

@generateStates
abstract class _$$MyFeatureState {
  // Simple fields with defaults
  final bool isLoading = false;
  final String? error = null;

  // Complex types
  final List<String> items = [];
  final Map<String, dynamic> metadata = {};

  // Custom model classes
  final UserModel? currentUser = null;
  final List<ProductModel> products = [];

  // Nested nullable fields
  final bool? isSubscribed = null;
  final SubscriptionDetails? subscriptionDetails = null;
}
```

This will generate:

```dart
// In main.g.dart
class MyFeatureState extends Equatable {
  final bool isLoading;
  final String? error;
  final List<String> items;
  final Map<String, dynamic> metadata;
  final UserModel? currentUser;
  final List<ProductModel> products;
  final bool? isSubscribed;
  final SubscriptionDetails? subscriptionDetails;

  const MyFeatureState({
    required this.isLoading,
    this.error,
    required this.items,
    required this.metadata,
    this.currentUser,
    required this.products,
    this.isSubscribed,
    this.subscriptionDetails,
  });

  static MyFeatureState initial() {
    return MyFeatureState(
      isLoading: false,
      error: null,
      items: [],
      metadata: {},
      currentUser: null,
      products: [],
      isSubscribed: null,
      subscriptionDetails: null,
    );
  }

  MyFeatureState copyWith({
    bool? isLoading,
    String? error,
    List<String>? items,
    Map<String, dynamic>? metadata,
    UserModel? currentUser,
    List<ProductModel>? products,
    bool? isSubscribed,
    SubscriptionDetails? subscriptionDetails,
  }) {
    return MyFeatureState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      items: items ?? this.items,
      metadata: metadata ?? this.metadata,
      currentUser: currentUser ?? this.currentUser,
      products: products ?? this.products,
      isSubscribed: isSubscribed ?? this.isSubscribed,
      subscriptionDetails: subscriptionDetails ?? this.subscriptionDetails,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
        items,
        metadata,
        currentUser,
        products,
        isSubscribed,
        subscriptionDetails,
      ];
}
```

### Using Generated Code

1. Run the generator:

```bash
# One-time generation
dart run build_runner build -d

# or watch for changes
dart run build_runner watch -d
```

2. Use in your bloc:

```dart
class MyFeatureBloc extends Bloc<BaseEvent, MyFeatureState> {
  MyFeatureBloc() : super(MyFeatureState.initial()) {
    on<Initialize>(_onInitialize);
    on<UserLoggedIn>(_onUserLoggedIn);
    on<UpdateSettings>(_onUpdateSettings);
    on<DataLoaded>(_onDataLoaded);
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<MyFeatureState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    // ... initialization logic
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _onUserLoggedIn(
    UserLoggedIn event,
    Emitter<MyFeatureState> emit,
  ) async {
    // Access event parameters
    print('User logged in: ${event.userId}, ${event.username}');
    // ... login logic
  }
}
```

## Advanced Usage

### Complex Event Examples

```dart
@generateEvents
abstract class BaseEvent extends Equatable {
  const BaseEvent();

  // Event with generic types
  factory BaseEvent.dataUpdated<T>({
    required T data,
    required String sourceId,
  }) = DataUpdated;

  // Event with complex objects
  factory BaseEvent.userProfileUpdated({
    required UserProfile profile,
    required List<Permission> permissions,
    Map<String, dynamic>? metadata,
  }) = UserProfileUpdated;

  // Event with nested objects
  factory BaseEvent.orderProcessed({
    required Order order,
    required PaymentDetails payment,
    required List<OrderItem> items,
    ShippingDetails? shipping,
  }) = OrderProcessed;
}
```

### Complex State Examples

```dart
@generateStates
abstract class _$$ComplexState {
  // Nested objects
  final UserSettings settings = UserSettings();
  final List<NotificationPreference> notifications = [];

  // Mapped data
  final Map<String, List<Product>> categoryProducts = {};
  final Map<int, OrderStatus> orderStatuses = {};

  // Nullable complex types
  final PaymentMethod? activePaymentMethod = null;
  final List<Address>? savedAddresses = null;

  // Enums with defaults
  final ThemeMode themeMode = ThemeMode.system;
  final Language currentLanguage = Language.english;

  // Timestamps
  final DateTime lastUpdated = DateTime.now();
  final DateTime? nextScheduledUpdate = null;
}
```

### Using With Custom Models

Ensure your models extend `Equatable` for proper state comparison:

```dart
class UserProfile extends Equatable {
  final String id;
  final String name;
  final String email;

  const UserProfile({
    required this.id,
    required this.name,
    required this.email,
  });

  @override
  List<Object?> get props => [id, name, email];
}
```

## Best Practices

1. **Event Naming:**
   - Use verb-noun combinations for event names (e.g., `UserLoggedIn`, `DataLoaded`)
   - Keep names descriptive but concise
   - Group related events together

2. **State Organization:**
   - Keep states focused on a single feature
   - Use meaningful field names
   - Group related fields together
   - Consider splitting large states into smaller ones

3. **Code Generation:**
   - Run `build_runner` in watch mode during development
   - Clear generated files if you encounter issues: `dart run build_runner clean`
   - Version control your generated files

## Troubleshooting

Common issues and solutions:

1. **Generator not running:**
   - Ensure all dependencies are correctly specified in `pubspec.yaml`
   - Run `flutter pub get`
   - Try cleaning the build: `dart run build_runner clean`

2. **Generation errors:**
   - Check that all required imports are present
   - Verify class names don't conflict
   - Ensure abstract classes are properly structured
   - Validate that all types used in states are available

3. **State not updating:**
   - Verify you're using the `copyWith` method
   - Check that Equatable is properly implemented
   - Ensure all required fields are included in props

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.


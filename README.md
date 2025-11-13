



# 🚀 Flutter Bloc Generator


**A revolutionary Flutter package that eliminates verbose boilerplate in BLoC pattern development.** Generate complete STATE, EVENT, and BLOC implementations from a single line of state variable declaration. With support for custom event classes through factory constructors, it dramatically reduces development time while maintaining type safety and best practices.

<img src="images/banner.png" alt="Flutter Bloc Generator Banner" style="width: 100%;" />

<p align="center">
  <br>
  <a href="https://pub.dev/packages/fbloc_event_gen">
    <img src="https://img.shields.io/pub/v/fbloc_event_gen.svg" alt="Pub Version" />
  </a>
  <a href="https://github.com/navaneethkrishnaindeed/bloc_gen">
    <img src="https://img.shields.io/github/stars/navaneethkrishnaindeed/bloc_gen" alt="GitHub" />
  </a>
  <a href="https://discord.gg/ckHZg5qsXZ">
    <img src="https://img.shields.io/badge/Discord-Join%20Server-7289da?logo=discord&logoColor=white" alt="Discord" />
  </a>
</p>

<table align="center">
  <tr>
    <td width="50%">

**Define States with @generateStates**

```dart
@generateStates
abstract class _$$BaseState {
  final bool active = false;
  final bool? isLoading = false;
  final bool isError = false;
}
```

</td>
    <td width="50%">

**Define Events with @generateEvents**

```dart

@generateEvents
abstract class BaseEvent extends Equatable {
  const BaseEvent();
}

```

</td>
  </tr>
  <tr>
    <td colspan="2">

**Use Generated Code - Simple Context Extension**

```dart
ElevatedButton(
  onPressed: () {
    context.setBaseBlocState(active: isActive);
  },
  child: Text('Active'),
), // ElevatedButton
```

</td>
  </tr>
</table>

---

## 🚀 Why Choose fbloc_event_gen?

### **VSCode Extension Available!**
Get the [Fbloc Event Gen extension](https://marketplace.visualstudio.com/items?itemName=NavaneethKrishna.fbloc-event-gen) from Visual Studio Marketplace to supercharge your development workflow!

### **Key Benefits**
- **Zero Boilerplate**: Generate all state, event, and even bloc code from a SINGLE VARIABLE
- **Simple State Updates**: Update state without remembering event names - just use `context.set{BlocName}State()`
- **Fully Customizable**: All options to customize your bloc and event code without hassle
- **Type-Safe**: Automatic type checking and null safety support
- **Production Ready**: Built for apps of any scale - from small projects to large enterprise applications

### **Community**
Join our growing community on [Discord](https://discord.gg/8a8gtHZrT6) to get support, share feedback, and stay updated with the latest features!


## 📚 Table of Contents

1. [Quick Start](#quick-start)
2. [Installation](#installation)
3. [Core Features](#core-features)
4. [Usage Guide](#usage-guide)
   - [Using @GenerateStates](#using-generatestates)
   - [Using @GenerateEvents](#using-generateevents)
   - [Complete Implementation](#complete-implementation)
5. [What Gets Generated](#what-gets-generated)
6. [Best Practices](#best-practices)
7. [Migration Guide](#migration-guide)
8. [Contributing](#contributing)
9. [License](#license)

---

<div id="quick-start"></div>

## ⚡ Quick Start

Get up and running in just 3 steps!

### Step 1: Add Dependencies

```yaml
dependencies:
  fbloc_event_gen: ^3.2.7
  equatable: ^2.0.7
  flutter_bloc: # Any Bloc Version

dev_dependencies:
  build_runner: ^2.4.6
```

### Step 2: Create Your Files

**counter_bloc.dart** (main file)
```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fbloc_event_gen/annotations.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';
part 'counter_bloc.g.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    // ⚠️ IMPORTANT: Register auto-generated events
    CounterState.registerEvents(this);
  }
}
```

**counter_state.dart**
```dart
part of 'counter_bloc.dart';

@generateStates
abstract class _$$CounterState {
  final int count = 0;
  final bool isLoading = false;
}
```

**counter_event.dart**
```dart
part of 'counter_bloc.dart';

@generateEvents
abstract class CounterEvent extends Equatable {
  const CounterEvent();
}
```

### Step 3: Run Code Generation

```bash
dart run build_runner build --delete-conflicting-outputs --use-polling-watcher
```

That's it! Now use `context.setCounterBlocState(count: 5)` anywhere in your widgets! 🎉

---

<div id="installation"></div>

## 📦 Installation

### Add to `pubspec.yaml`

```yaml
dependencies:
  fbloc_event_gen: ^3.2.7
  equatable: ^2.0.7
  flutter_bloc:   # Any Bloc Version above Required for BLoC pattern

dev_dependencies:
  build_runner: ^2.4.6
```

### Install Packages

```bash
flutter pub get
```

### Setup Build Runner (Optional - Watch Mode)

For automatic code generation on file changes:

```bash
dart run build_runner watch --delete-conflicting-outputs --use-polling-watcher
```

Or for one-time generation:

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

<div id="core-features"></div>

## ✨ Core Features

<table>
<tr>
<td width="33%" align="center">

### Two Annotations

**@GenerateStates**  
Complete state management

**@GenerateEvents**  
Custom event classes

</td>
<td width="33%" align="center">

### Auto Generation

- Type-safe events  
- Immutable states  
- Context extensions  
- copyWith methods  

</td>
<td width="33%" align="center">

### Built-in Safety

- Null safety  
- Equatable support  
- Type checking  
- Documentation  

</td>
</tr>
</table>

---

<div id="usage-guide"></div>

## 📖 Usage Guide

> **⚠️ IMPORTANT NOTE**  
> When using `@GenerateStates`, you **MUST** call `{YourState}.registerEvents(this)` in your bloc constructor.  
> Without this, the `context.set{YourBloc}State()` extension won't work!
>
> ```dart
> class YourBloc extends Bloc<YourEvent, YourState> {
>   YourBloc() : super(YourState.initial()) {
>     YourState.registerEvents(this);  // ← Don't forget this!
>   }
> }
> ```

---

<a name="using-generatestates"></a>
### Using @GenerateStates

`@GenerateStates` is your all-in-one solution for complete state management. Simply define your state variables with initial values, and let the generator create everything else!

**📝 Define Your State** (counter_state.dart)

```dart
part of 'counter_bloc.dart';

@generateStates
abstract class _$$CounterState {
  final int counter = 0;
  final bool isLoading = false;
  final String? message = null;
  final List<String> items = const [];
  final Map<String, dynamic> data = const {};
}
```

**📝 Create Your Bloc** (counter_bloc.dart - main file)

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fbloc_event_gen/annotations.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';
part 'counter_bloc.g.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    // ⚠️ CRITICAL: This line is REQUIRED for context.setCounterBlocState() to work
    CounterState.registerEvents(this);
  }
}
```

**📝 Define Your Event** (counter_event.dart)

```dart
part of 'counter_bloc.dart';

@generateEvents
abstract class CounterEvent extends Equatable {
  const CounterEvent();
}
```

**What You Get**

- `CounterState` class with all properties
- `CounterState.initial()` factory constructor
- `copyWith()` method for immutable updates
- `copyWithNull()` for setting nullable fields to null
- Auto-generated events for each property
- `context.setCounterBlocState()` extension method
- `registerEvents()` method for easy bloc setup
- Full Equatable implementation

---

<a name="using-generateevents"></a>
### Using @GenerateEvents

`@GenerateEvents` is perfect when you need custom event classes with factory constructors. Great for complex user actions!

**📝 Main Bloc File** (auth_bloc.dart)

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fbloc_event_gen/annotations.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.g.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initial()) {
    AuthState.registerEvents(this);
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
  }
  
  void _onLogin(LoginEvent event, Emitter<AuthState> emit) {
    // Your login logic
  }
  
  void _onLogout(LogoutEvent event, Emitter<AuthState> emit) {
    // Your logout logic
  }
}
```

**📝 Define Your Events** (auth_event.dart)

```dart
part of 'auth_bloc.dart';

@generateEvents
abstract class AuthEvent extends Equatable {
  const AuthEvent();
  
  // Login event with required and optional parameters
  const factory AuthEvent.login({
    required String email,
    required String password,
    bool? rememberMe,
  }) = LoginEvent;
  
  // Simple logout event
  const factory AuthEvent.logout() = LogoutEvent;
  
  // Update profile event
  const factory AuthEvent.updateProfile({
    required String name,
    String? avatarUrl,
  }) = UpdateProfileEvent;
}
```

**📝 Define Your State** (auth_state.dart)

```dart
part of 'auth_bloc.dart';

@generateStates
abstract class _$$AuthState {
  final bool isAuthenticated = false;
  final String? userId = null;
  final String? token = null;
}
```

**What You Get**

- Complete event classes (`LoginEvent`, `LogoutEvent`, etc.)
- Proper constructors with required/optional parameters
- Equatable implementation with props
- Immutable and type-safe events

---

<a name="complete-implementation"></a>
### Complete Implementation

Here's a full example showing how everything works together:

#### 1. Main Bloc File (counter_bloc.dart)

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fbloc_event_gen/annotations.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';
part 'counter_bloc.g.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    // Register auto-generated state update events
    CounterState.registerEvents(this);
    
    // Handle custom events
    on<IncrementEvent>(_onIncrement);
    on<DecrementEvent>(_onDecrement);
    on<ResetEvent>(_onReset);
  }
  
  void _onIncrement(IncrementEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(count: state.count + 1));
  }
  
  void _onDecrement(DecrementEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(count: state.count - 1));
  }
  
  void _onReset(ResetEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(count: 0));
  }
}
```

#### 2. State File (counter_state.dart)

```dart
part of 'counter_bloc.dart';

@generateStates
abstract class _$$CounterState {
  final int count = 0;
  final bool isLoading = false;
  final String? errorMessage = null;
}
```

#### 3. Event File (counter_event.dart)

```dart
part of 'counter_bloc.dart';

@generateEvents
abstract class CounterEvent extends Equatable {
  const CounterEvent();
  
  const factory CounterEvent.increment() = IncrementEvent;
  const factory CounterEvent.decrement() = DecrementEvent;
  const factory CounterEvent.reset() = ResetEvent;
}
```

> 💡 **File Structure:** These 3 files will generate `counter_bloc.g.dart` containing all the generated code.

#### 4. Use in Widget

```dart
class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Display state
        BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text('Count: ${state.count}');
          },
        ),
        
        // Traditional way - using custom events
        ElevatedButton(
          onPressed: () => context.read<CounterBloc>().add(
            const CounterEvent.increment()
          ),
          child: Text('Increment'),
        ),
        
        // Generated way - direct state updates
        ElevatedButton(
          onPressed: () => context.setCounterBlocState(
            count: 100,
            isLoading: true,
          ),
          child: Text('Set to 100'),
        ),
      ],
    );
  }
}
```

---

<div id="what-gets-generated"></div>

## 🔍 What Gets Generated

Understanding what code is generated helps you leverage the full power of fbloc_event_gen!

### For @GenerateEvents

When you define:

```dart
@generateEvents
abstract class AuthEvent extends Equatable {
  const AuthEvent();
  
  const factory AuthEvent.login({
    required String email,
    required String password,
    bool? rememberMe,
  }) = LoginEvent;
  
  const factory AuthEvent.logout() = LogoutEvent;
}
```

**You automatically get:**

```dart
// **************************************************************************
// EventGenerator
// **************************************************************************

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  final bool? rememberMe;

  const LoginEvent({
    required this.email,
    required this.password,
    this.rememberMe,
  });

  @override
  List<Object?> get props => [email, password, rememberMe];
}

class LogoutEvent extends AuthEvent {
  const LogoutEvent();

  @override
  List<Object?> get props => [];
}
```

**Benefits:** Type-safe, immutable events with automatic Equatable implementation!

---

### For @GenerateStates

When you define:

```dart
@generateStates
abstract class _$$CounterState {
  final int count = 0;
  final bool isLoading = false;
  final String? message = null;
}
```

**You automatically get:**

<details>
<summary><b>🎯 State Class with Auto-Generated Events</b></summary>

```dart
// Auto-generated events for each state property
class UpdateCountEvent extends CounterEvent {
  final int count;
  const UpdateCountEvent({required this.count});

  @override
  List<Object?> get props => [count];
}

class UpdateIsLoadingEvent extends CounterEvent {
  final bool isLoading;
  const UpdateIsLoadingEvent({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class UpdateMessageEvent extends CounterEvent {
  final String? message;
  const UpdateMessageEvent({required this.message});

  @override
  List<Object?> get props => [message];
}
```

</details>

<details>
<summary><b>📦 Complete State Class</b></summary>

```dart
class CounterState extends Equatable {
  final int count;
  final bool isLoading;
  final String? message;

  const CounterState({
    required this.count,
    required this.isLoading,
    this.message,
  });

  // Factory constructor for initial state
  static CounterState initial() {
    return const CounterState(
      count: 0,
      isLoading: false,
      message: null,
    );
  }

  // copyWith method for immutable updates
  CounterState copyWith({
    int? count,
    bool? isLoading,
    String? message,
  }) {
    return CounterState(
      count: count ?? this.count,
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
    );
  }

  // copyWithNull for nullable fields
  CounterState copyWithNull({bool message = false}) {
    return CounterState(
      count: this.count,
      isLoading: this.isLoading,
      message: message ? null : this.message,
    );
  }

  // Auto-registers event handlers
  static void registerEvents(CounterBloc bloc) {
    bloc.on<UpdateCountEvent>((event, emit) {
      emit(bloc.state.copyWith(count: event.count));
    });

    bloc.on<UpdateIsLoadingEvent>((event, emit) {
      emit(bloc.state.copyWith(isLoading: event.isLoading));
    });

    bloc.on<UpdateMessageEvent>((event, emit) {
      if (event.message == null) {
        emit(bloc.state.copyWithNull(message: true));
      } else {
        emit(bloc.state.copyWith(message: event.message));
      }
    });
  }

  @override
  List<Object?> get props => [count, isLoading, message];
}
```

</details>

<details>
<summary><b>🔧 BuildContext Extension</b></summary>

```dart
extension CounterBlocContextExtension on BuildContext {
  /// Updates the CounterBloc state with the provided values.
  /// Only specified parameters will be updated; others remain unchanged.
  void setCounterBlocState({
    Object? count = UnspecifiedDataType.instance,
    Object? isLoading = UnspecifiedDataType.instance,
    Object? message = UnspecifiedDataType.instance,
  }) {
    final bloc = read<CounterBloc>();
    
    if (count != UnspecifiedDataType.instance) {
      bloc.add(UpdateCountEvent(count: count as int));
    }

    if (isLoading != UnspecifiedDataType.instance) {
      bloc.add(UpdateIsLoadingEvent(isLoading: isLoading as bool));
    }

    if (message != UnspecifiedDataType.instance) {
      bloc.add(UpdateMessageEvent(message: message as String?));
    }
  }
}
```

</details>

**Benefits:**
- Complete state class with all properties
- `initial()` factory with default values
- `copyWith()` for immutable updates
- `copyWithNull()` for nullable fields
- Auto-generated update events
- `registerEvents()` for easy setup
- Context extensions for easy state updates
- Full documentation comments

---

<div id="best-practices"></div>

## 💡 Best Practices

### State Management

<table>
<tr>
<td width="50%">

**DO**

```dart
@generateStates
abstract class _$$UserState {
  final String username = '';
  final bool isAuthenticated = false;
  final String? profileUrl = null;
}
```
Use meaningful, descriptive names  
Provide default values  
Consider nullability carefully  

</td>
<td width="50%">

**DON'T**

```dart
@generateStates
abstract class _$$UserState {
  final String u = '';
  final bool b = false;
  final String? x;
}
```
Avoid cryptic variable names  
Don't skip default values  
Don't over-use nullable types  

</td>
</tr>
</table>

### Event Naming

<table>
<tr>
<td width="50%">

**DO**

```dart
@generateEvents
abstract class AuthEvent {
  const factory AuthEvent.loginWithEmail({
    required String email,
    required String password,
  }) = LoginWithEmailEvent;
}
```
Use descriptive names  
Follow verb-noun pattern  
Group related events  

</td>
<td width="50%">

**DON'T**

```dart
@generateEvents
abstract class AuthEvent {
  const factory AuthEvent.e1({
    String? x,
    String? y,
  }) = Event1;
}
```
Avoid generic names  
Don't use numbered events  
Missing documentation  

</td>
</tr>
</table>

### When to Use What

| Use Case | Recommendation | Why? |
|----------|---------------|------|
| Simple state updates | `context.set{Bloc}State()` | Cleaner, less code |
| Complex business logic | Custom events + handlers | Better separation of concerns |
| Multiple state changes | `copyWith()` in bloc | Atomic state updates |
| Nullable field reset | `copyWithNull()` | Explicitly set to null |
| Initial setup | `{State}.initial()` | Consistent defaults |

### File Organization

```
lib/
├── blocs/
│   ├── auth/
│   │   ├── auth_bloc.dart        # Main bloc file (imports, bloc class)
│   │   ├── auth_event.dart       # Event definitions with @generateEvents
│   │   ├── auth_state.dart       # State definitions with @generateStates
│   │   └── auth_bloc.g.dart      # Generated file (auto-generated events + states)
│   └── counter/
│       ├── counter_bloc.dart     # Main bloc file (imports, bloc class)
│       ├── counter_event.dart    # Event definitions with @generateEvents
│       ├── counter_state.dart    # State definitions with @generateStates
│       └── counter_bloc.g.dart   # Generated file (auto-generated events + states)
```

**File Structure Breakdown:**

| File | Purpose | Contains |
|------|---------|----------|
| `{name}_bloc.dart` | Main file | Imports, part declarations, Bloc class |
| `{name}_state.dart` | State definition | `part of` + `@generateStates` |
| `{name}_event.dart` | Event definition | `part of` + `@generateEvents` |
| `{name}_bloc.g.dart` | Generated code | Auto-generated events, states, extensions |

---

<div id="migration-guide"></div>

## 🔄 Migration Guide

### Migrating from 2.x to 3.x

#### Step 1: Update Dependencies

```yaml
dependencies:
  fbloc_event_gen: ^3.2.7  # Update version
```

#### Step 2: Update State Class Names

**Before:**
```dart
@generateStates
abstract class MyState {
  // ...
}
```

**After:**
```dart
@generateStates
abstract class _$$MyState {  // Add _$$ prefix
  // ...
}
```

#### Step 3: Add Initial Values

**Before:**
```dart
abstract class _$$MyState {
  final int counter;
  final bool isLoading;
}
```

**After:**
```dart
abstract class _$$MyState {
  final int counter = 0;           // Add defaults
  final bool isLoading = false;     // Add defaults
}
```

#### Step 4: Run Code Generation

```bash
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

---

<div id="contributing"></div>

## 🤝 Contributing

We love contributions! 💙

### How to Contribute

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Ways to Contribute

- Report bugs
- Suggest new features
- Improve documentation
- Add tests
- Fix issues

See our [Contributing Guide](CONTRIBUTING.md) for more details.

---

<div id="license"></div>

## 📝 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

Special thanks to all our contributors and the Flutter community for their support!

### Show Your Support

If you like this package, please give it a ⭐ on [GitHub](https://github.com/navaneethkrishnaindeed/bloc_gen)!

### Get in Touch

- [Discord Community](https://discord.gg/8a8gtHZrT6)
- [GitHub Issues](https://github.com/navaneethkrishnaindeed/bloc_gen/issues)
- [Pub.dev](https://pub.dev/packages/fbloc_event_gen)

---

<p align="center">Made with ❤️ for the Flutter Community</p>
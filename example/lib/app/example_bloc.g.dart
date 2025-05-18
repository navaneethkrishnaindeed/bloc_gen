// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_bloc.dart';

// **************************************************************************
// EventGenerator
// **************************************************************************

class UpdateIsLoadingGet extends ExampleEvent {
  final bool? isLoading;

  const UpdateIsLoadingGet(this.isLoading);

  @override
  List<Object?> get props => [isLoading];
}

// **************************************************************************
// StateGenerator
// **************************************************************************

// Events Generated for corresponding states in State Class
class UpdateIsLoadingEvent extends ExampleEvent {
  final bool? isLoading;
  const UpdateIsLoadingEvent({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class UpdateCounterEvent extends ExampleEvent {
  final int counter;
  const UpdateCounterEvent({required this.counter});

  @override
  List<Object?> get props => [counter];
}

class UpdateDataEvent extends ExampleEvent {
  final String? data;
  const UpdateDataEvent({required this.data});

  @override
  List<Object?> get props => [data];
}

class UpdateDssEvent extends ExampleEvent {
  final String? dss;
  const UpdateDssEvent({required this.dss});

  @override
  List<Object?> get props => [dss];
}

class UpdateIterableEvent extends ExampleEvent {
  final Iterable<String> iterable;
  const UpdateIterableEvent({required this.iterable});

  @override
  List<Object?> get props => [iterable];
}

class UpdateListNmEvent extends ExampleEvent {
  final List<String> listNm;
  const UpdateListNmEvent({required this.listNm});

  @override
  List<Object?> get props => [listNm];
}

class UpdateMapgenerateEvent extends ExampleEvent {
  final Map<String, int> mapgenerate;
  const UpdateMapgenerateEvent({required this.mapgenerate});

  @override
  List<Object?> get props => [mapgenerate];
}

class UpdateListEvent extends ExampleEvent {
  final Map<String?, String?> list;
  const UpdateListEvent({required this.list});

  @override
  List<Object?> get props => [list];
}

class UpdateSelectedDaysEvent extends ExampleEvent {
  final List<bool> selectedDays;
  const UpdateSelectedDaysEvent({required this.selectedDays});

  @override
  List<Object?> get props => [selectedDays];
}

class UpdateTestEvent extends ExampleEvent {
  final Map<dynamic, dynamic>? test;
  const UpdateTestEvent({required this.test});

  @override
  List<Object?> get props => [test];
}

/// A state class that represents the complete state of the 'ExampleBloc'.
/// This class is immutable and extends Equatable for value comparison.
class ExampleState extends Equatable {
  final bool? isLoading;
  final int counter;
  final String? data;
  final String? dss;
  final Iterable<String> iterable;
  final List<String> listNm;
  final Map<String, int> mapgenerate;
  final Map<String?, String?> list;
  final List<bool> selectedDays;
  final Map<dynamic, dynamic>? test;

  /// Creates a new instance of ExampleState with the given parameters.
  const ExampleState(
      {this.isLoading,
      required this.counter,
      this.data,
      this.dss,
      required this.iterable,
      required this.listNm,
      required this.mapgenerate,
      required this.list,
      required this.selectedDays,
      this.test});

  /// Creates the initial state of the 'ExampleBloc'.
  /// This method sets up default values for all state properties.
  static ExampleState initial() {
    return ExampleState(
        isLoading: false,
        counter: 0,
        data: "You have pushed the button this many times:",
        dss: null,
        iterable: [],
        listNm: List.generate(10, (index) => 'item $index'),
        mapgenerate: Map<String, int>.fromEntries(
          ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
              .map((e) => MapEntry<String, int>(e, int.parse(e))),
        ),
        list: {},
        selectedDays: [],
        test: {});
  }

  /// Creates a copy of this state with the given parameters replaced.
  /// If a parameter is not provided, the value from the current state is used.
  ExampleState copyWith(
      {bool? isLoading,
      int? counter,
      String? data,
      String? dss,
      Iterable<String>? iterable,
      List<String>? listNm,
      Map<String, int>? mapgenerate,
      Map<String?, String?>? list,
      List<bool>? selectedDays,
      Map<dynamic, dynamic>? test}) {
    return ExampleState(
        isLoading: isLoading ?? this.isLoading,
        counter: counter ?? this.counter,
        data: data ?? this.data,
        dss: dss ?? this.dss,
        iterable: iterable ?? this.iterable,
        listNm: listNm ?? this.listNm,
        mapgenerate: mapgenerate ?? this.mapgenerate,
        list: list ?? this.list,
        selectedDays: selectedDays ?? this.selectedDays,
        test: test ?? this.test);
  }

  /// Creates a copy of this state with the ability to set specific fields to null.
  /// The boolean parameters control whether the corresponding field should be set to null.
  ExampleState copyWithNull(
      {bool isLoading = false,
      int? counter,
      bool data = false,
      bool dss = false,
      Iterable<String>? iterable,
      List<String>? listNm,
      Map<String, int>? mapgenerate,
      Map<String?, String?>? list,
      List<bool>? selectedDays,
      bool test = false}) {
    return ExampleState(
        isLoading: isLoading ? null : this.isLoading,
        counter: counter ?? this.counter,
        data: data ? null : this.data,
        dss: dss ? null : this.dss,
        iterable: iterable ?? this.iterable,
        listNm: listNm ?? this.listNm,
        mapgenerate: mapgenerate ?? this.mapgenerate,
        list: list ?? this.list,
        selectedDays: selectedDays ?? this.selectedDays,
        test: test ? null : this.test);
  }

  /// Registers all event handlers for the 'ExampleBloc'.
  /// This method sets up the event-to-state mapping for all possible state updates.
  static void registerEvents(ExampleBloc bloc) {
    bloc.on<UpdateIsLoadingEvent>((event, emit) {
      if (event.isLoading == null) {
        emit(bloc.state.copyWithNull(isLoading: true));
      } else {
        emit(bloc.state.copyWith(isLoading: event.isLoading));
      }
    });

    bloc.on<UpdateCounterEvent>((event, emit) {
      emit(bloc.state.copyWith(counter: event.counter));
    });

    bloc.on<UpdateDataEvent>((event, emit) {
      if (event.data == null) {
        emit(bloc.state.copyWithNull(data: true));
      } else {
        emit(bloc.state.copyWith(data: event.data));
      }
    });

    bloc.on<UpdateDssEvent>((event, emit) {
      if (event.dss == null) {
        emit(bloc.state.copyWithNull(dss: true));
      } else {
        emit(bloc.state.copyWith(dss: event.dss));
      }
    });

    bloc.on<UpdateIterableEvent>((event, emit) {
      emit(bloc.state.copyWith(iterable: event.iterable));
    });

    bloc.on<UpdateListNmEvent>((event, emit) {
      emit(bloc.state.copyWith(listNm: event.listNm));
    });

    bloc.on<UpdateMapgenerateEvent>((event, emit) {
      emit(bloc.state.copyWith(mapgenerate: event.mapgenerate));
    });

    bloc.on<UpdateListEvent>((event, emit) {
      emit(bloc.state.copyWith(list: event.list));
    });

    bloc.on<UpdateSelectedDaysEvent>((event, emit) {
      emit(bloc.state.copyWith(selectedDays: event.selectedDays));
    });

    bloc.on<UpdateTestEvent>((event, emit) {
      if (event.test == null) {
        emit(bloc.state.copyWithNull(test: true));
      } else {
        emit(bloc.state.copyWith(test: event.test));
      }
    });
  }

  /// Returns a list of all properties used for equality comparison.
  @override
  List<Object?> get props => [
        isLoading,
        counter,
        data,
        dss,
        iterable,
        listNm,
        mapgenerate,
        list,
        selectedDays,
        test
      ];
}

/// Extension on BuildContext that provides convenient methods for updating the 'ExampleBloc' state.
/// This extension simplifies state updates by providing a single method to update multiple state properties.
extension ExampleBlocContextExtension on BuildContext {
  /// Updates the 'ExampleBloc' state with the provided values.
  /// Only the specified parameters will be updated; others will remain unchanged.
  /// Uses UnspecifiedDataType.instance as a sentinel value to determine which parameters to update.
  void setExampleBlocState({
    dynamic isLoading = UnspecifiedDataType.instance,
    dynamic counter = UnspecifiedDataType.instance,
    dynamic data = UnspecifiedDataType.instance,
    dynamic dss = UnspecifiedDataType.instance,
    dynamic iterable = UnspecifiedDataType.instance,
    dynamic listNm = UnspecifiedDataType.instance,
    dynamic mapgenerate = UnspecifiedDataType.instance,
    dynamic list = UnspecifiedDataType.instance,
    dynamic selectedDays = UnspecifiedDataType.instance,
    dynamic test = UnspecifiedDataType.instance,
  }) {
    final myBloc = read<ExampleBloc>(); // Read the MyBloc instance
    if (isLoading != UnspecifiedDataType.instance) {
      myBloc.add(UpdateIsLoadingEvent(isLoading: isLoading as bool?));
    }

    if (counter != UnspecifiedDataType.instance) {
      myBloc.add(UpdateCounterEvent(counter: counter as int));
    }

    if (data != UnspecifiedDataType.instance) {
      myBloc.add(UpdateDataEvent(data: data as String?));
    }

    if (dss != UnspecifiedDataType.instance) {
      myBloc.add(UpdateDssEvent(dss: dss as String?));
    }

    if (iterable != UnspecifiedDataType.instance) {
      myBloc.add(UpdateIterableEvent(iterable: iterable.cast<String>()));
    }

    if (listNm != UnspecifiedDataType.instance) {
      myBloc.add(UpdateListNmEvent(listNm: listNm.cast<String>()));
    }

    if (mapgenerate != UnspecifiedDataType.instance) {
      myBloc.add(
          UpdateMapgenerateEvent(mapgenerate: mapgenerate.cast<String, int>()));
    }

    if (list != UnspecifiedDataType.instance) {
      myBloc.add(UpdateListEvent(list: list.cast<String?, String?>()));
    }

    if (selectedDays != UnspecifiedDataType.instance) {
      myBloc.add(
          UpdateSelectedDaysEvent(selectedDays: selectedDays.cast<bool>()));
    }

    if (test != UnspecifiedDataType.instance) {
      myBloc.add(UpdateTestEvent(test: test.cast<dynamic, dynamic>()));
    }
  }
}

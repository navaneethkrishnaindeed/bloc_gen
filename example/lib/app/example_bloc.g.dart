// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_bloc.dart';

// **************************************************************************
// StateGenerator
// **************************************************************************

class UpdateIsLoadingEvent extends ExampleEvent {
  final bool isLoading;
  const UpdateIsLoadingEvent({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class UpdateConterEvent extends ExampleEvent {
  final int conter;
  const UpdateConterEvent({required this.conter});

  @override
  List<Object?> get props => [conter];
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

class ExampleState extends Equatable {
  final bool isLoading;
  final int conter;
  final String? data;
  final String? dss;
  final Map<String?, String?> list;
  final List<bool> selectedDays;
  final Map<dynamic, dynamic>? test;

  const ExampleState(
      {required this.isLoading,
      required this.conter,
      this.data,
      this.dss,
      required this.list,
      required this.selectedDays,
      this.test});

  static ExampleState initial() {
    return ExampleState(
        isLoading: false,
        conter: 0,
        data: "You have pushed the button this many times:",
        dss: null,
        list: {},
        selectedDays: [],
        test: {});
  }

  ExampleState copyWith(
      {bool? isLoading,
      int? conter,
      String? data,
      String? dss,
      Map<String?, String?>? list,
      List<bool>? selectedDays,
      Map<dynamic, dynamic>? test}) {
    return ExampleState(
        isLoading: isLoading ?? this.isLoading,
        conter: conter ?? this.conter,
        data: data ?? this.data,
        dss: dss ?? this.dss,
        list: list ?? this.list,
        selectedDays: selectedDays ?? this.selectedDays,
        test: test ?? this.test);
  }

  ExampleState copyWithNull(
      {bool? isLoading,
      int? conter,
      bool data = false,
      bool dss = false,
      Map<String?, String?>? list,
      List<bool>? selectedDays,
      bool test = false}) {
    return ExampleState(
        isLoading: isLoading ?? this.isLoading,
        conter: conter ?? this.conter,
        data: data ? null : this.data,
        dss: dss ? null : this.dss,
        list: list ?? this.list,
        selectedDays: selectedDays ?? this.selectedDays,
        test: test ? null : this.test);
  }

  static void registerEvents(ExampleBloc bloc) {
    bloc.on<UpdateIsLoadingEvent>((event, emit) {
      emit(bloc.state.copyWith(isLoading: event.isLoading));
    });

    bloc.on<UpdateConterEvent>((event, emit) {
      emit(bloc.state.copyWith(conter: event.conter));
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

  @override
  List<Object?> get props =>
      [isLoading, conter, data, dss, list, selectedDays, test];
}

extension ExampleBlocContextExtension on BuildContext {
  void setExampleBlocState({
    Object? isLoading = UnspecifiedDataType.instance,
    Object? conter = UnspecifiedDataType.instance,
    Object? data = UnspecifiedDataType.instance,
    Object? dss = UnspecifiedDataType.instance,
    Object? list = UnspecifiedDataType.instance,
    Object? selectedDays = UnspecifiedDataType.instance,
    Object? test = UnspecifiedDataType.instance,
  }) {
    final myBloc = read<ExampleBloc>(); // Read the MyBloc instance
    if (isLoading != UnspecifiedDataType.instance) {
      myBloc.add(UpdateIsLoadingEvent(isLoading: isLoading as bool));
    }

    if (conter != UnspecifiedDataType.instance) {
      myBloc.add(UpdateConterEvent(conter: conter as int));
    }

    if (data != UnspecifiedDataType.instance) {
      myBloc.add(UpdateDataEvent(data: data as String?));
    }

    if (dss != UnspecifiedDataType.instance) {
      myBloc.add(UpdateDssEvent(dss: dss as String?));
    }

    if (list != UnspecifiedDataType.instance) {
      myBloc.add(UpdateListEvent(list: list as Map<String?, String?>));
    }

    if (selectedDays != UnspecifiedDataType.instance) {
      myBloc.add(
          UpdateSelectedDaysEvent(selectedDays: selectedDays as List<bool>));
    }

    if (test != UnspecifiedDataType.instance) {
      myBloc.add(UpdateTestEvent(test: test as Map<dynamic, dynamic>?));
    }
  }
}

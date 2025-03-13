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

class ExampleState extends Equatable {
  final bool isLoading;
  final int conter;
  final String? data;
  final String? dss;

  const ExampleState(
      {required this.isLoading, required this.conter, this.data, this.dss});

  static ExampleState initial() {
    return ExampleState(
        isLoading: false,
        conter: 0,
        data: "You have pushed the button this many times:",
        dss: null);
  }

  ExampleState copyWith(
      {
      /// Data type [bool]
      Object? isLoading = UnspecifiedDataType.instance,

      /// Data type [int]
      Object? conter = UnspecifiedDataType.instance,

      /// Data type [String?]
      Object? data = UnspecifiedDataType.instance,

      /// Data type [String?]
      Object? dss = UnspecifiedDataType.instance}) {
    return ExampleState(
        isLoading: isLoading is UnspecifiedDataType
            ? this.isLoading
            : (isLoading as bool),
        conter: conter is UnspecifiedDataType ? this.conter : (conter as int),
        data: data is UnspecifiedDataType ? this.data : (data as String?),
        dss: dss is UnspecifiedDataType ? this.dss : (dss as String?));
  }

  static void registerEvents(ExampleBloc bloc) {
    bloc.on<UpdateIsLoadingEvent>((event, emit) {
      emit(bloc.state.copyWith(isLoading: event.isLoading));
    });

    bloc.on<UpdateConterEvent>((event, emit) {
      emit(bloc.state.copyWith(conter: event.conter));
    });

    bloc.on<UpdateDataEvent>((event, emit) {
      emit(bloc.state.copyWith(data: event.data));
    });

    bloc.on<UpdateDssEvent>((event, emit) {
      emit(bloc.state.copyWith(dss: event.dss));
    });
  }

  @override
  List<Object?> get props => [isLoading, conter, data, dss];
}

extension ExampleBlocContextExtension on BuildContext {
  void setExampleBlocState({
    Object? isLoading = UnspecifiedDataType.instance,
    Object? conter = UnspecifiedDataType.instance,
    Object? data = UnspecifiedDataType.instance,
    Object? dss = UnspecifiedDataType.instance,
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
  }
}

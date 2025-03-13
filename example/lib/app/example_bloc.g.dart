// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_bloc.dart';

// **************************************************************************
// StateGenerator
// **************************************************************************

class UpdateIsLoadingEvent extends ExampleEvent {
  final bool? isLoading;
  const UpdateIsLoadingEvent({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class UpdateIsLoadingDatasEvent extends ExampleEvent {
  final String? isLoadingDatas;
  const UpdateIsLoadingDatasEvent({required this.isLoadingDatas});

  @override
  List<Object?> get props => [isLoadingDatas];
}

enum ExampleStateField { isLoading, isLoadingDatas }

class ExampleState extends Equatable {
  final bool? isLoading;
  final String? isLoadingDatas;

  const ExampleState({this.isLoading, this.isLoadingDatas});

  static ExampleState initial() {
    return ExampleState(isLoading: false, isLoadingDatas: "Object()");
  }

  ExampleState copyWith({bool? isLoading, String? isLoadingDatas}) {
    return ExampleState(
        isLoading: isLoading ?? this.isLoading,
        isLoadingDatas: isLoadingDatas ?? this.isLoadingDatas);
  }

  static void registerEvents(ExampleBloc bloc) {
    bloc.on<UpdateIsLoadingEvent>((event, emit) {
      emit(bloc.state.copyWith(isLoading: event.isLoading));
    });

    bloc.on<UpdateIsLoadingDatasEvent>((event, emit) {
      emit(bloc.state.copyWith(isLoadingDatas: event.isLoadingDatas));
    });
  }

  @override
  List<Object?> get props => [isLoading, isLoadingDatas];
}

extension ExampleBlocContextExtension on BuildContext {
  void setExampleBlocState({bool? isLoading, String? isLoadingDatas}) {
    final myBloc = read<ExampleBloc>();
    if (isLoading != null) {
      myBloc.add(UpdateIsLoadingEvent(isLoading: isLoading));
    }

    if (isLoadingDatas != null) {
      myBloc.add(UpdateIsLoadingDatasEvent(isLoadingDatas: isLoadingDatas));
    }
  }
}

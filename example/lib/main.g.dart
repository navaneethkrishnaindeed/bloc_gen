// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

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

class UpdateIsLoadingEvent extends BaseEvent {
  final bool? isLoading;
  const UpdateIsLoadingEvent({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class UpdateIsErrorEvent extends BaseEvent {
  final bool isError;
  const UpdateIsErrorEvent({required this.isError});

  @override
  List<Object?> get props => [isError];
}

class UpdateErrorMessagesEvent extends BaseEvent {
  final List<String>? errorMessages;
  const UpdateErrorMessagesEvent({required this.errorMessages});

  @override
  List<Object?> get props => [errorMessages];
}

class UpdateIsSetUserDetailsSuccessEvent extends BaseEvent {
  final bool isSetUserDetailsSuccess;
  const UpdateIsSetUserDetailsSuccessEvent(
      {required this.isSetUserDetailsSuccess});

  @override
  List<Object?> get props => [isSetUserDetailsSuccess];
}

class UpdateIsStateClearedEvent extends BaseEvent {
  final bool isStateCleared;
  const UpdateIsStateClearedEvent({required this.isStateCleared});

  @override
  List<Object?> get props => [isStateCleared];
}

class UpdateIsGetFeatureSuccessEvent extends BaseEvent {
  final bool isGetFeatureSuccess;
  const UpdateIsGetFeatureSuccessEvent({required this.isGetFeatureSuccess});

  @override
  List<Object?> get props => [isGetFeatureSuccess];
}

class UpdateGetUserContextSuccessEvent extends BaseEvent {
  final bool getUserContextSuccess;
  const UpdateGetUserContextSuccessEvent({required this.getUserContextSuccess});

  @override
  List<Object?> get props => [getUserContextSuccess];
}

class UpdateBusinessDataModelEvent extends BaseEvent {
  final List<BusinessDataModel> businessDataModel;
  const UpdateBusinessDataModelEvent({required this.businessDataModel});

  @override
  List<Object?> get props => [businessDataModel];
}

class UpdateErrorModelEvent extends BaseEvent {
  final ErrorModel errorModel;
  const UpdateErrorModelEvent({required this.errorModel});

  @override
  List<Object?> get props => [errorModel];
}

class UpdateBusinessIdEvent extends BaseEvent {
  final int? businessId;
  const UpdateBusinessIdEvent({required this.businessId});

  @override
  List<Object?> get props => [businessId];
}

class UpdateIsGetUserActiveBusinessEvent extends BaseEvent {
  final bool isGetUserActiveBusiness;
  const UpdateIsGetUserActiveBusinessEvent(
      {required this.isGetUserActiveBusiness});

  @override
  List<Object?> get props => [isGetUserActiveBusiness];
}

class UpdateGetUserResponseEvent extends BaseEvent {
  final GetMyUserResponseModelsssss getUserResponse;
  const UpdateGetUserResponseEvent({required this.getUserResponse});

  @override
  List<Object?> get props => [getUserResponse];
}

class UpdateIsGetCardCapabilitySuccessEvent extends BaseEvent {
  final bool isGetCardCapabilitySuccess;
  const UpdateIsGetCardCapabilitySuccessEvent(
      {required this.isGetCardCapabilitySuccess});

  @override
  List<Object?> get props => [isGetCardCapabilitySuccess];
}

class UpdateIsBusinessSubscriptionActiveEvent extends BaseEvent {
  final bool? isBusinessSubscriptionActive;
  const UpdateIsBusinessSubscriptionActiveEvent(
      {required this.isBusinessSubscriptionActive});

  @override
  List<Object?> get props => [isBusinessSubscriptionActive];
}

class UpdateIsTokenInvalidEvent extends BaseEvent {
  final bool? isTokenInvalid;
  const UpdateIsTokenInvalidEvent({required this.isTokenInvalid});

  @override
  List<Object?> get props => [isTokenInvalid];
}

class UpdateIsGetBusinessDataSuccessEvent extends BaseEvent {
  final bool isGetBusinessDataSuccess;
  const UpdateIsGetBusinessDataSuccessEvent(
      {required this.isGetBusinessDataSuccess});

  @override
  List<Object?> get props => [isGetBusinessDataSuccess];
}

class UpdateShowLoginButtonEvent extends BaseEvent {
  final bool showLoginButton;
  const UpdateShowLoginButtonEvent({required this.showLoginButton});

  @override
  List<Object?> get props => [showLoginButton];
}

class UpdateLoaderValueEvent extends BaseEvent {
  final String loaderValue;
  const UpdateLoaderValueEvent({required this.loaderValue});

  @override
  List<Object?> get props => [loaderValue];
}

class BaseState extends Equatable {
  final bool? isLoading;
  final bool isError;
  final List<String>? errorMessages;
  final bool isSetUserDetailsSuccess;
  final bool isStateCleared;
  final bool isGetFeatureSuccess;
  final bool getUserContextSuccess;
  final List<BusinessDataModel> businessDataModel;
  final ErrorModel errorModel;
  final int? businessId;
  final bool isGetUserActiveBusiness;
  final GetMyUserResponseModelsssss getUserResponse;
  final bool isGetCardCapabilitySuccess;
  final bool? isBusinessSubscriptionActive;
  final bool? isTokenInvalid;
  final bool isGetBusinessDataSuccess;
  final bool showLoginButton;
  final String loaderValue;

  const BaseState(
      {this.isLoading,
      required this.isError,
      this.errorMessages,
      required this.isSetUserDetailsSuccess,
      required this.isStateCleared,
      required this.isGetFeatureSuccess,
      required this.getUserContextSuccess,
      required this.businessDataModel,
      required this.errorModel,
      this.businessId,
      required this.isGetUserActiveBusiness,
      required this.getUserResponse,
      required this.isGetCardCapabilitySuccess,
      this.isBusinessSubscriptionActive,
      this.isTokenInvalid,
      required this.isGetBusinessDataSuccess,
      required this.showLoginButton,
      required this.loaderValue});

  static BaseState initial() {
    return BaseState(
        isLoading: false,
        isError: false,
        errorMessages: [],
        isSetUserDetailsSuccess: false,
        isStateCleared: false,
        isGetFeatureSuccess: false,
        getUserContextSuccess: false,
        businessDataModel: [],
        errorModel: ErrorModel(),
        businessId: null,
        isGetUserActiveBusiness: false,
        getUserResponse: GetMyUserResponseModelsssss(),
        isGetCardCapabilitySuccess: false,
        isBusinessSubscriptionActive: null,
        isTokenInvalid: false,
        isGetBusinessDataSuccess: false,
        showLoginButton: false,
        loaderValue: "Loading...");
  }

  BaseState copyWith(
      {bool? isLoading,
      bool? isError,
      List<String>? errorMessages,
      bool? isSetUserDetailsSuccess,
      bool? isStateCleared,
      bool? isGetFeatureSuccess,
      bool? getUserContextSuccess,
      List<BusinessDataModel>? businessDataModel,
      ErrorModel? errorModel,
      int? businessId,
      bool? isGetUserActiveBusiness,
      GetMyUserResponseModelsssss? getUserResponse,
      bool? isGetCardCapabilitySuccess,
      bool? isBusinessSubscriptionActive,
      bool? isTokenInvalid,
      bool? isGetBusinessDataSuccess,
      bool? showLoginButton,
      String? loaderValue}) {
    return BaseState(
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
        errorMessages: errorMessages ?? this.errorMessages,
        isSetUserDetailsSuccess:
            isSetUserDetailsSuccess ?? this.isSetUserDetailsSuccess,
        isStateCleared: isStateCleared ?? this.isStateCleared,
        isGetFeatureSuccess: isGetFeatureSuccess ?? this.isGetFeatureSuccess,
        getUserContextSuccess:
            getUserContextSuccess ?? this.getUserContextSuccess,
        businessDataModel: businessDataModel ?? this.businessDataModel,
        errorModel: errorModel ?? this.errorModel,
        businessId: businessId ?? this.businessId,
        isGetUserActiveBusiness:
            isGetUserActiveBusiness ?? this.isGetUserActiveBusiness,
        getUserResponse: getUserResponse ?? this.getUserResponse,
        isGetCardCapabilitySuccess:
            isGetCardCapabilitySuccess ?? this.isGetCardCapabilitySuccess,
        isBusinessSubscriptionActive:
            isBusinessSubscriptionActive ?? this.isBusinessSubscriptionActive,
        isTokenInvalid: isTokenInvalid ?? this.isTokenInvalid,
        isGetBusinessDataSuccess:
            isGetBusinessDataSuccess ?? this.isGetBusinessDataSuccess,
        showLoginButton: showLoginButton ?? this.showLoginButton,
        loaderValue: loaderValue ?? this.loaderValue);
  }

  static void registerEvents(BaseBloc bloc) {
    bloc.on<UpdateIsLoadingEvent>((event, emit) {
      emit(bloc.state.copyWith(isLoading: event.isLoading));
    });

    bloc.on<UpdateIsErrorEvent>((event, emit) {
      emit(bloc.state.copyWith(isError: event.isError));
    });

    bloc.on<UpdateErrorMessagesEvent>((event, emit) {
      emit(bloc.state.copyWith(errorMessages: event.errorMessages));
    });

    bloc.on<UpdateIsSetUserDetailsSuccessEvent>((event, emit) {
      emit(bloc.state
          .copyWith(isSetUserDetailsSuccess: event.isSetUserDetailsSuccess));
    });

    bloc.on<UpdateIsStateClearedEvent>((event, emit) {
      emit(bloc.state.copyWith(isStateCleared: event.isStateCleared));
    });

    bloc.on<UpdateIsGetFeatureSuccessEvent>((event, emit) {
      emit(bloc.state.copyWith(isGetFeatureSuccess: event.isGetFeatureSuccess));
    });

    bloc.on<UpdateGetUserContextSuccessEvent>((event, emit) {
      emit(bloc.state
          .copyWith(getUserContextSuccess: event.getUserContextSuccess));
    });

    bloc.on<UpdateBusinessDataModelEvent>((event, emit) {
      emit(bloc.state.copyWith(businessDataModel: event.businessDataModel));
    });

    bloc.on<UpdateErrorModelEvent>((event, emit) {
      emit(bloc.state.copyWith(errorModel: event.errorModel));
    });

    bloc.on<UpdateBusinessIdEvent>((event, emit) {
      emit(bloc.state.copyWith(businessId: event.businessId));
    });

    bloc.on<UpdateIsGetUserActiveBusinessEvent>((event, emit) {
      emit(bloc.state
          .copyWith(isGetUserActiveBusiness: event.isGetUserActiveBusiness));
    });

    bloc.on<UpdateGetUserResponseEvent>((event, emit) {
      emit(bloc.state.copyWith(getUserResponse: event.getUserResponse));
    });

    bloc.on<UpdateIsGetCardCapabilitySuccessEvent>((event, emit) {
      emit(bloc.state.copyWith(
          isGetCardCapabilitySuccess: event.isGetCardCapabilitySuccess));
    });

    bloc.on<UpdateIsBusinessSubscriptionActiveEvent>((event, emit) {
      emit(bloc.state.copyWith(
          isBusinessSubscriptionActive: event.isBusinessSubscriptionActive));
    });

    bloc.on<UpdateIsTokenInvalidEvent>((event, emit) {
      emit(bloc.state.copyWith(isTokenInvalid: event.isTokenInvalid));
    });

    bloc.on<UpdateIsGetBusinessDataSuccessEvent>((event, emit) {
      emit(bloc.state
          .copyWith(isGetBusinessDataSuccess: event.isGetBusinessDataSuccess));
    });

    bloc.on<UpdateShowLoginButtonEvent>((event, emit) {
      emit(bloc.state.copyWith(showLoginButton: event.showLoginButton));
    });

    bloc.on<UpdateLoaderValueEvent>((event, emit) {
      emit(bloc.state.copyWith(loaderValue: event.loaderValue));
    });
  }

  @override
  List<Object?> get props => [
        isLoading,
        isError,
        errorMessages,
        isSetUserDetailsSuccess,
        isStateCleared,
        isGetFeatureSuccess,
        getUserContextSuccess,
        businessDataModel,
        errorModel,
        businessId,
        isGetUserActiveBusiness,
        getUserResponse,
        isGetCardCapabilitySuccess,
        isBusinessSubscriptionActive,
        isTokenInvalid,
        isGetBusinessDataSuccess,
        showLoginButton,
        loaderValue
      ];
}

extension BaseBlocContextExtension on BuildContext {
  void setBaseBlocState(
      {bool? isLoading,
      bool? isError,
      List<String>? errorMessages,
      bool? isSetUserDetailsSuccess,
      bool? isStateCleared,
      bool? isGetFeatureSuccess,
      bool? getUserContextSuccess,
      List<BusinessDataModel>? businessDataModel,
      ErrorModel? errorModel,
      int? businessId,
      bool? isGetUserActiveBusiness,
      GetMyUserResponseModelsssss? getUserResponse,
      bool? isGetCardCapabilitySuccess,
      bool? isBusinessSubscriptionActive,
      bool? isTokenInvalid,
      bool? isGetBusinessDataSuccess,
      bool? showLoginButton,
      String? loaderValue}) {
    final myBloc = read<BaseBloc>(); // Read the MyBloc instance
    if (isLoading != null) {
      myBloc.add(UpdateIsLoadingEvent(isLoading: isLoading));
    }

    if (isError != null) {
      myBloc.add(UpdateIsErrorEvent(isError: isError));
    }

    if (errorMessages != null) {
      myBloc.add(UpdateErrorMessagesEvent(errorMessages: errorMessages));
    }

    if (isSetUserDetailsSuccess != null) {
      myBloc.add(UpdateIsSetUserDetailsSuccessEvent(
          isSetUserDetailsSuccess: isSetUserDetailsSuccess));
    }

    if (isStateCleared != null) {
      myBloc.add(UpdateIsStateClearedEvent(isStateCleared: isStateCleared));
    }

    if (isGetFeatureSuccess != null) {
      myBloc.add(UpdateIsGetFeatureSuccessEvent(
          isGetFeatureSuccess: isGetFeatureSuccess));
    }

    if (getUserContextSuccess != null) {
      myBloc.add(UpdateGetUserContextSuccessEvent(
          getUserContextSuccess: getUserContextSuccess));
    }

    if (businessDataModel != null) {
      myBloc.add(
          UpdateBusinessDataModelEvent(businessDataModel: businessDataModel));
    }

    if (errorModel != null) {
      myBloc.add(UpdateErrorModelEvent(errorModel: errorModel));
    }

    if (businessId != null) {
      myBloc.add(UpdateBusinessIdEvent(businessId: businessId));
    }

    if (isGetUserActiveBusiness != null) {
      myBloc.add(UpdateIsGetUserActiveBusinessEvent(
          isGetUserActiveBusiness: isGetUserActiveBusiness));
    }

    if (getUserResponse != null) {
      myBloc.add(UpdateGetUserResponseEvent(getUserResponse: getUserResponse));
    }

    if (isGetCardCapabilitySuccess != null) {
      myBloc.add(UpdateIsGetCardCapabilitySuccessEvent(
          isGetCardCapabilitySuccess: isGetCardCapabilitySuccess));
    }

    if (isBusinessSubscriptionActive != null) {
      myBloc.add(UpdateIsBusinessSubscriptionActiveEvent(
          isBusinessSubscriptionActive: isBusinessSubscriptionActive));
    }

    if (isTokenInvalid != null) {
      myBloc.add(UpdateIsTokenInvalidEvent(isTokenInvalid: isTokenInvalid));
    }

    if (isGetBusinessDataSuccess != null) {
      myBloc.add(UpdateIsGetBusinessDataSuccessEvent(
          isGetBusinessDataSuccess: isGetBusinessDataSuccess));
    }

    if (showLoginButton != null) {
      myBloc.add(UpdateShowLoginButtonEvent(showLoginButton: showLoginButton));
    }

    if (loaderValue != null) {
      myBloc.add(UpdateLoaderValueEvent(loaderValue: loaderValue));
    }
  }
}

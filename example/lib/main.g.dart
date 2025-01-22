// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// EventGenerator
// **************************************************************************

class UserLoggedIn extends SplashScreenEvent {
  final String userId;
  final String userIdde;
  final bool? gfg;

  const UserLoggedIn({required this.userId, required this.userIdde, this.gfg});

  @override
  List<Object?> get props => [userId, userIdde, gfg];
}

class UserLoggedOut extends SplashScreenEvent {
  const UserLoggedOut();

  @override
  List<Object?> get props => [];
}

class DataLoaded extends SplashScreenEvent {
  final List<String> items;

  const DataLoaded({required this.items});

  @override
  List<Object?> get props => [items];
}

class UpdateIsLoadingEvent extends SplashScreenEvent {
   final bool? isLoading;
  const UpdateIsLoadingEvent({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class UpdateIsErrorEvent extends SplashScreenEvent {
   final bool isError;
  const UpdateIsErrorEvent({required this.isError});

  @override
  List<Object?> get props => [isError];
}

class UpdateErrorMessagesEvent extends SplashScreenEvent {
   final List<String>? errorMessages;
  const UpdateErrorMessagesEvent({required this.errorMessages});

  @override
  List<Object?> get props => [errorMessages];
}

class UpdateIsSetUserDetailsSuccessEvent extends SplashScreenEvent {
   final bool isSetUserDetailsSuccess;
  const UpdateIsSetUserDetailsSuccessEvent({required this.isSetUserDetailsSuccess});

  @override
  List<Object?> get props => [isSetUserDetailsSuccess];
}

class UpdateIsStateClearedEvent extends SplashScreenEvent {
   final bool isStateCleared;
  const UpdateIsStateClearedEvent({required this.isStateCleared});

  @override
  List<Object?> get props => [isStateCleared];
}

class UpdateIsGetFeatureSuccessEvent extends SplashScreenEvent {
   final bool isGetFeatureSuccess;
  const UpdateIsGetFeatureSuccessEvent({required this.isGetFeatureSuccess});

  @override
  List<Object?> get props => [isGetFeatureSuccess];
}

class UpdateGetUserContextSuccessEvent extends SplashScreenEvent {
   final bool getUserContextSuccess;
  const UpdateGetUserContextSuccessEvent({required this.getUserContextSuccess});

  @override
  List<Object?> get props => [getUserContextSuccess];
}

class UpdateBusinessDataModelEvent extends SplashScreenEvent {
   final List<BusinessDataModel> businessDataModel;
  const UpdateBusinessDataModelEvent({required this.businessDataModel});

  @override
  List<Object?> get props => [businessDataModel];
}

class UpdateErrorModelEvent extends SplashScreenEvent {
   final ErrorModel errorModel;
  const UpdateErrorModelEvent({required this.errorModel});

  @override
  List<Object?> get props => [errorModel];
}

class UpdateBusinessIdEvent extends SplashScreenEvent {
   final int? businessId;
  const UpdateBusinessIdEvent({required this.businessId});

  @override
  List<Object?> get props => [businessId];
}

class UpdateIsGetUserActiveBusinessEvent extends SplashScreenEvent {
   final bool isGetUserActiveBusiness;
  const UpdateIsGetUserActiveBusinessEvent({required this.isGetUserActiveBusiness});

  @override
  List<Object?> get props => [isGetUserActiveBusiness];
}

class UpdateGetUserResponseEvent extends SplashScreenEvent {
   final GetMyUserResponseModel getUserResponse;
  const UpdateGetUserResponseEvent({required this.getUserResponse});

  @override
  List<Object?> get props => [getUserResponse];
}

class UpdateIsGetCardCapabilitySuccessEvent extends SplashScreenEvent {
   final bool isGetCardCapabilitySuccess;
  const UpdateIsGetCardCapabilitySuccessEvent({required this.isGetCardCapabilitySuccess});

  @override
  List<Object?> get props => [isGetCardCapabilitySuccess];
}

class UpdateIsBusinessSubscriptionActiveEvent extends SplashScreenEvent {
   final bool? isBusinessSubscriptionActive;
  const UpdateIsBusinessSubscriptionActiveEvent({required this.isBusinessSubscriptionActive});

  @override
  List<Object?> get props => [isBusinessSubscriptionActive];
}

class UpdateIsTokenInvalidEvent extends SplashScreenEvent {
   final bool? isTokenInvalid;
  const UpdateIsTokenInvalidEvent({required this.isTokenInvalid});

  @override
  List<Object?> get props => [isTokenInvalid];
}

class UpdateIsGetBusinessDataSuccessEvent extends SplashScreenEvent {
   final bool isGetBusinessDataSuccess;
  const UpdateIsGetBusinessDataSuccessEvent({required this.isGetBusinessDataSuccess});

  @override
  List<Object?> get props => [isGetBusinessDataSuccess];
}

class UpdateShowLoginButtonEvent extends SplashScreenEvent {
   final bool showLoginButton;
  const UpdateShowLoginButtonEvent({required this.showLoginButton});

  @override
  List<Object?> get props => [showLoginButton];
}

class UpdateLoaderValueEvent extends SplashScreenEvent {
   final String loaderValue;
  const UpdateLoaderValueEvent({required this.loaderValue});

  @override
  List<Object?> get props => [loaderValue];
}



class SplashScreenState extends Equatable {
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
final GetMyUserResponseModel getUserResponse;
final bool isGetCardCapabilitySuccess;
final bool? isBusinessSubscriptionActive;
final bool? isTokenInvalid;
final bool isGetBusinessDataSuccess;
final bool showLoginButton;
final String loaderValue;

  const SplashScreenState({
   this.isLoading,
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
      required this.loaderValue
  });

  static SplashScreenState initial() {
    return SplashScreenState(
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
        getUserResponse: GetMyUserResponseModel(),
        isGetCardCapabilitySuccess: false,
        isBusinessSubscriptionActive: null,
        isTokenInvalid: false,
        isGetBusinessDataSuccess: false,
        showLoginButton: false,
        loaderValue: "Loading..."
    );
  }

  SplashScreenState copyWith({
  bool? isLoading,
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
      GetMyUserResponseModel? getUserResponse,
      bool? isGetCardCapabilitySuccess,
      bool? isBusinessSubscriptionActive,
      bool? isTokenInvalid,
      bool? isGetBusinessDataSuccess,
      bool? showLoginButton,
      String? loaderValue
  }) {
    return SplashScreenState(
       isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
        errorMessages: errorMessages ?? this.errorMessages,
        isSetUserDetailsSuccess: isSetUserDetailsSuccess ?? this.isSetUserDetailsSuccess,
        isStateCleared: isStateCleared ?? this.isStateCleared,
        isGetFeatureSuccess: isGetFeatureSuccess ?? this.isGetFeatureSuccess,
        getUserContextSuccess: getUserContextSuccess ?? this.getUserContextSuccess,
        businessDataModel: businessDataModel ?? this.businessDataModel,
        errorModel: errorModel ?? this.errorModel,
        businessId: businessId ?? this.businessId,
        isGetUserActiveBusiness: isGetUserActiveBusiness ?? this.isGetUserActiveBusiness,
        getUserResponse: getUserResponse ?? this.getUserResponse,
        isGetCardCapabilitySuccess: isGetCardCapabilitySuccess ?? this.isGetCardCapabilitySuccess,
        isBusinessSubscriptionActive: isBusinessSubscriptionActive ?? this.isBusinessSubscriptionActive,
        isTokenInvalid: isTokenInvalid ?? this.isTokenInvalid,
        isGetBusinessDataSuccess: isGetBusinessDataSuccess ?? this.isGetBusinessDataSuccess,
        showLoginButton: showLoginButton ?? this.showLoginButton,
        loaderValue: loaderValue ?? this.loaderValue
    );
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// StateGenerator
// **************************************************************************

/*

*/
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

  const SplashScreenState(
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
        loaderValue: "Loading...");
  }

  SplashScreenState copyWith(
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
      GetMyUserResponseModel? getUserResponse,
      bool? isGetCardCapabilitySuccess,
      bool? isBusinessSubscriptionActive,
      bool? isTokenInvalid,
      bool? isGetBusinessDataSuccess,
      bool? showLoginButton,
      String? loaderValue}) {
    return SplashScreenState(
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

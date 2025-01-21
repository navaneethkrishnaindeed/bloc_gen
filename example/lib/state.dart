import 'package:equatable/equatable.dart';
import 'package:fbloc_event_gen/annotations.dart';
part 'state.g.dart';

@generateStates
abstract class _$$SplashScreenState {
  
  final bool? isLoading = false;
  final bool isError = false;
  final List<String>? errorMessages = [];
  final bool isSetUserDetailsSuccess = false;
  final bool isStateCleared = false;
  final bool isGetFeatureSuccess = false;
  final bool getUserContextSuccess = false;
  final List<BusinessDataModel> businessDataModel = [];
  final ErrorModel errorModel = ErrorModel();
  final int? businessId = null;
  final bool isGetUserActiveBusiness = false;
  final GetMyUserResponseModel getUserResponse = GetMyUserResponseModel();
  final bool isGetCardCapabilitySuccess = false;
  final bool? isBusinessSubscriptionActive = null;
  final bool? isTokenInvalid = false;
  final bool isGetBusinessDataSuccess = false;
  final bool showLoginButton = false;
  final String loaderValue = "Loading...";
}
class BusinessDataModel{}
class ErrorModel{}
class GetMyUserResponseModel{}

part of 'main.dart';
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


// extension MyPackageContextExtension on BuildContext {
//   // Custom function to dispatch an event to a BLoC
//   void splashStateSet({bool? isActive}) {
//     // Access MyBloc from context and dispatch MyEvent
//     final myBloc = read<BaseBloc>();  // Read the MyBloc instance
//     // if(isActive!=null)
//     myBloc.add(Update(active: isActive!));          // Dispatch the event
//   }
// }

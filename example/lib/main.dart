import 'package:equatable/equatable.dart';
import 'package:fbloc_event_gen/annotations.dart';

part 'main.g.dart';

void main() {}

@generateEvents
abstract class BaseEvent extends Equatable {
  const BaseEvent();

  factory BaseEvent.userLoggedIn(
      {required String userId,
      required String userIdde,
      bool? gfg}) = UserLoggedIn;
  factory BaseEvent.userLoggedOut() = UserLoggedOut;
  factory BaseEvent.dataLoaded({required List<String> items}) = DataLoaded;
}

@generateStates
abstract class _$$BaseState {
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
  final List<Map<String, dynamic>> ds = [];
  final List<Map<String, dynamic>> items = [
    {"label": 'Physical', "value": "1"},
    {"label": 'Virtual', "value": "2"}
  ];
}

class BaseBloc extends Bloc<BaseEvent, BaseState> {
  BaseBloc() : super(BaseState.initial()) {
    // Register all event handlers automatically
    BaseState.registerEvents(this);

    // Add your custom event handlers
    on<UserLoggedIn>(_onUserLoggedIn);
  }

  Future<void> _onUserLoggedIn(
    UserLoggedIn event,
    Emitter<BaseState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    // ... authentication logic
    emit(state.copyWith(
      isLoading: false,
      isAuthenticated: true,
    ));
  }
}

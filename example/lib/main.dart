import 'package:equatable/equatable.dart';
import 'package:fbloc_event_gen/annotations.dart';

part 'state.dart';
part 'events.dart';
part 'main.g.dart';

void main() {
  // Check the Example File in the Git to Get more comprehencive Example IMplemetation
}

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
  final GetMyUserResponseModelsssss getUserResponse =
      GetMyUserResponseModelsssss();
  final bool isGetCardCapabilitySuccess = false;
  final bool? isBusinessSubscriptionActive = null;
  final bool? isTokenInvalid = false;
  final bool isGetBusinessDataSuccess = false;
  final bool showLoginButton = false;
  final String loaderValue = "Loading...";
  final CardsQueryModel? filterListSelected = CardsQueryModel(
      pageNo: 0,
      pageNoList: 0,
      cardHolderIds:
          hasPermission([Permissions.cardManager]) ? [userInfo.id] : null);

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

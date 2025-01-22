
part of 'main.dart';

@generateEvents
abstract class SplashScreenEvent extends Equatable {
  const SplashScreenEvent();

  factory SplashScreenEvent.userLoggedIn({required String userId,required String userIdde, bool? gfg}) = UserLoggedIn;
  factory SplashScreenEvent.userLoggedOut() = UserLoggedOut;
  factory SplashScreenEvent.dataLoaded({required List<String> items}) = DataLoaded;
}

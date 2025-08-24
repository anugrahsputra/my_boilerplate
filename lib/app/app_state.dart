part of 'app_cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.initial() = AppInitial;
  const factory AppState.loading() = AppLoading;
  const factory AppState.authenticated() = AppAuthenticated;
  const factory AppState.unauthenticated() = AppUnauthenticated;
  const factory AppState.error(String message) = AppError;
}

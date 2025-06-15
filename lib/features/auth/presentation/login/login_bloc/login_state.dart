part of 'login_bloc.dart';

/*
@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitial;
  const factory LoginState.loading() = LoginLoading;
  const factory LoginState.success() = LoginSuccess;
  const factory LoginState.failed() = LoginFailed;
}
*/

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    required String email,
    required String password,
    required bool isLoading,
    String? errorMessage,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
    email: '',
    password: '',
    isLoading: false,
    errorMessage: null,
  );
}
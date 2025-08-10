part of 'login_bloc.dart';

@freezed
abstract class LoginEvent with _$LoginEvent {
  const factory LoginEvent.onEmailChanged(String email) = LoginOnEmailChanged;
  const factory LoginEvent.onPasswordChanged(String password) =
      LoginOnPasswordChanged;
  const factory LoginEvent.onError() = LoginOnError;
  const factory LoginEvent.onLogin() = OnLogin;
}

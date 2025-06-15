part of 'login_bloc.dart';

@freezed
abstract class LoginEvent with _$LoginEvent {
  const factory LoginEvent.onEmailChanged(String email) = OnEmailChanged;
  const factory LoginEvent.onPasswordChanged(String password) = OnPasswordChanged;
  const factory LoginEvent.onLogin() = OnLogin;
}
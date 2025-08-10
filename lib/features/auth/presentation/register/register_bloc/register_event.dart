part of 'register_bloc.dart';

@freezed
abstract class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.onNameChanged(String name) =
      RegisterOnNameChanged;
  const factory RegisterEvent.onPhoneChanged(String phoneNumber) =
      RegisterOnPhoneChanged;
  const factory RegisterEvent.onEmailChanged(String email) =
      RegisterOnEmailChanged;
  const factory RegisterEvent.onPasswordChanged(String password) =
      RegisterOnPasswordChanged;
  const factory RegisterEvent.onError() = RegisterOnError;
  const factory RegisterEvent.onRegister() = OnRegister;
}

part of 'register_bloc.dart';

@freezed
abstract class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.onEmailChanged(String email) =
      RegisterOnEmailChanged;
  const factory RegisterEvent.onPasswordChanged(String password) =
      RegisterOnPasswordChanged;
  const factory RegisterEvent.onRegister() = OnRegister;
}

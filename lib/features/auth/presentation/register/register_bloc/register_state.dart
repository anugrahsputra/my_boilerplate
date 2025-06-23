part of 'register_bloc.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({
    required bool isLoading,
    required bool isSuccess,
    String? errorMessage,
  }) = _RegisterState;

  factory RegisterState.initial() => const RegisterState(
    isLoading: false,
    isSuccess: false,
    errorMessage: null,
  );
}
part of 'register_bloc.dart';

// @freezed
// abstract class RegisterState with _$RegisterState {
//   const factory RegisterState.initial() = RegisterInitial;
//   const factory RegisterState.loading() = RegisterLoading;
//   const factory RegisterState.success() = RegisterSuccess;
//   const factory RegisterState.failed() = RegisterFailed;
// }

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({
    required String email,
    required String password,
    required bool isLoading,
    required bool isSuccess,
    String? errorMessage,
  }) = _RegisterState;

  factory RegisterState.initial() => const RegisterState(
    email: '',
    password: '',
    isLoading: false,
    isSuccess: false,
    errorMessage: null,
  );
}

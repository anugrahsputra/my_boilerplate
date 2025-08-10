part of 'register_bloc.dart';

// @freezed
// abstract class RegisterState with _$RegisterState {
//   const factory RegisterState({
//     required bool isLoading,
//     required bool isSuccess,
//     String? errorMessage,
//   }) = _RegisterState;
//
//   factory RegisterState.initial() => const RegisterState(
//     isLoading: false,
//     isSuccess: false,
//     errorMessage: null,
//   );
// }

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(Name.pure()) Name name,
    @Default(PhoneNumber.pure()) PhoneNumber phoneNumber,
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(false) bool isValid,
    @Default(false) bool hasSubmitted,
    String? errorMessage,
  }) = _RegisterState;
}

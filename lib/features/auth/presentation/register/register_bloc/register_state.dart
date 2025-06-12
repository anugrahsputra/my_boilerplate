part of 'register_bloc.dart';


@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = RegisterInitial;
  const factory RegisterState.loading() = RegisterLoading;
  const factory RegisterState.success() = RegisterSuccess;
  const factory RegisterState.failed() = RegisterFailed;
}
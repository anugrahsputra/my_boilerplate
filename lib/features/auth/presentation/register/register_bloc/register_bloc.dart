import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth.dart';

part 'register_bloc.freezed.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUsecase registerUsecase;

  RegisterBloc({required this.registerUsecase})
    : super(const RegisterInitial()) {
    on<OnRegister>(_onRegister);
  }

  Future<void> _onRegister(
    OnRegister event,
    Emitter<RegisterState> emit,
  ) async {
    final registerReq = RegisterReqDto(email: event.email, password: event.password);

    emit(const RegisterLoading());
    final result = await registerUsecase.execute(registerReq);
    result.fold(
      (failure) => emit(const RegisterFailed()),
      (register) => emit(const RegisterSuccess()),
    );
  }
}
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth.dart';

part 'register_bloc.freezed.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUsecase registerUsecase;

  RegisterBloc({required this.registerUsecase})
    : super(RegisterState.initial()) {
    on<RegisterOnEmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<RegisterOnPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    on<OnRegister>(_onRegister);
  }

  Future<void> _onRegister(
    OnRegister event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isSuccess: false, isLoading: true, errorMessage: null));

    final registerReq = RegisterReqDto(
      email: state.email,
      password: state.password,
    );

    final result = await registerUsecase.execute(registerReq);

    result.fold(
      (l) => emit(
        state.copyWith(
          isSuccess: false,
          isLoading: false,
          errorMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(isSuccess: true, isLoading: false, errorMessage: null),
      ),
    );
  }
}

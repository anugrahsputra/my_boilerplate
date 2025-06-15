import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_boilerplate/features/auth/auth.dart';

part 'login_bloc.freezed.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;

  LoginBloc({required this.loginUsecase}) : super(LoginState.initial()) {
    on<OnEmailChanged>((event, emit) => emit(state.copyWith(email: event.email)));

    on<OnPasswordChanged>((event, emit) => emit(state.copyWith(password: event.password)));

    on<OnLogin>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      final loginReq = LoginReqDto(email: state.email, password: state.password);

      final result = await loginUsecase.execute(loginReq);

      result.fold(
        (l) => emit(state.copyWith(isLoading: false, errorMessage: l.message)),
        (r) => emit(state.copyWith(isLoading: false, errorMessage: null)),
      );
    });
  }


}
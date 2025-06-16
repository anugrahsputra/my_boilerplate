import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:my_boilerplate/features/auth/auth.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;
  final Logger log = Logger("Login Bloc");

  LoginBloc({required this.loginUsecase}) : super(LoginState.initial()) {
    on<LoginOnEmailChanged>(
      (event, emit) => emit(state.copyWith(email: event.email)),
    );

    on<LoginOnPasswordChanged>(
      (event, emit) => emit(state.copyWith(password: event.password)),
    );

    on<OnLogin>(_onLogin);
  }

  Future<void> _onLogin(OnLogin event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isSuccess: false, isLoading: true, errorMessage: null));

    final loginReq = LoginReqDto(email: state.email, password: state.password);
    final result = await loginUsecase.execute(loginReq);

    log.info(loginReq.toJson());
    result.fold(
      (l) => emit(
        state.copyWith(
          isSuccess: false,
          isLoading: false,
          errorMessage: l.message,
        ),
      ),
      (l) => emit(
        state.copyWith(isSuccess: true, isLoading: false, errorMessage: null),
      ),
    );
  }
}

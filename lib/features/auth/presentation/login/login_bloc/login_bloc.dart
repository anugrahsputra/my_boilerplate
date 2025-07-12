import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/auth.dart';

part 'login_bloc.freezed.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;
  final Logger log = Logger("Login Bloc");

  LoginBloc({required this.loginUsecase}) : super(LoginState()) {
    on<LoginOnEmailChanged>(
      _loginOnEmailChanged,
      transformer: debounce(const Duration(milliseconds: 500)),
    );
    on<LoginOnPasswordChanged>(
      _loginOnPasswordChanged,
      transformer: debounce(const Duration(milliseconds: 500)),
    );
    on<LoginOnError>(_onError);
    on<OnLogin>(_onLogin);
  }

  void _loginOnEmailChanged(
    LoginOnEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final email = Email.dirty(event.email);
    final isValid = Formz.validate([email, state.password]);
    emit(state.copyWith(email: email, isValid: isValid));
  }

  void _loginOnPasswordChanged(
    LoginOnPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    final isValid = Formz.validate([password, state.email]);
    emit(state.copyWith(password: password, isValid: isValid));
  }

  void _onError(LoginOnError event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(status: FormzSubmissionStatus.failure, errorMessage: null),
    );
  }

  void _onLogin(OnLogin event, Emitter<LoginState> emit) async {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    final isValid = Formz.validate([email, password]);

    emit(
      state.copyWith(
        email: email,
        password: password,
        isValid: isValid,
        hasSubmitted: true,
      ),
    );

    if (!isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final loginReq = LoginReqDto(email: email.value, password: password.value);
    final result = await loginUsecase.execute(loginReq);

    log.info(loginReq.toJson());
    result.fold(
      (l) => emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: FormzSubmissionStatus.success,
          errorMessage: null,
        ),
      ),
    );
  }
}

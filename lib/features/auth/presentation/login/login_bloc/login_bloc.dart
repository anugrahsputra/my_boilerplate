import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_boilerplate/features/auth/auth.dart';

part 'login_bloc.freezed.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;

  LoginBloc({required this.loginUsecase}) : super(const LoginInitial()) {
    on<OnLogin>(_onLogin);
  }

  Future<void> _onLogin(OnLogin event, Emitter<LoginState> emit) async {
    final loginReq = LoginReqDto(email: event.email, password: event.password);

    emit(const LoginLoading());
    final result = await loginUsecase.execute(loginReq);
    result.fold(
      (failure) => emit(const LoginFailed()),
      (login) => emit(const LoginSuccess()),
    );
  }
}
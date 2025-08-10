import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/auth.dart';

part 'register_bloc.freezed.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUsecase registerUsecase;
  final Logger log = Logger("Register Bloc");

  RegisterBloc({required this.registerUsecase}) : super(RegisterState()) {
    on<RegisterOnNameChanged>(_onNameChanged);
    on<RegisterOnPhoneChanged>(_onPhoneChanged);
    on<RegisterOnEmailChanged>(_onEmailChanged);
    on<RegisterOnPasswordChanged>(_onPasswordChanged);
    on<RegisterOnError>(_onError);
    on<OnRegister>(_onRegister);
  }

  void _onNameChanged(
    RegisterOnNameChanged event,
    Emitter<RegisterState> emit,
  ) {
    final name = Name.dirty(event.name);
    final isValid = Formz.validate([
      name,
      state.phoneNumber,
      state.email,
      state.password,
    ]);
    emit(state.copyWith(name: name, isValid: isValid));
  }

  void _onPhoneChanged(
    RegisterOnPhoneChanged event,
    Emitter<RegisterState> emit,
  ) {
    final phoneNumber = PhoneNumber.dirty(event.phoneNumber);
    final isValid = Formz.validate([
      phoneNumber,
      state.name,
      state.email,
      state.password,
    ]);
    emit(state.copyWith(phoneNumber: phoneNumber, isValid: isValid));
  }

  void _onEmailChanged(
    RegisterOnEmailChanged event,
    Emitter<RegisterState> emit,
  ) {
    final email = Email.dirty(event.email);
    final isValid = Formz.validate([
      email,
      state.name,
      state.phoneNumber,
      state.password,
    ]);
    emit(state.copyWith(email: email, isValid: isValid));
  }

  void _onPasswordChanged(
    RegisterOnPasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    final password = Password.dirty(event.password);
    final isValid = Formz.validate([
      password,
      state.name,
      state.phoneNumber,
      state.email,
    ]);
    emit(state.copyWith(password: password, isValid: isValid));
  }

  void _onError(RegisterOnError event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(status: FormzSubmissionStatus.failure, errorMessage: null),
    );
  }

  Future<void> _onRegister(
    OnRegister event,
    Emitter<RegisterState> emit,
  ) async {
    final name = Name.dirty(state.name.value);
    final phoneNumber = PhoneNumber.dirty(state.phoneNumber.value);
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    final isValid = Formz.validate([name, phoneNumber, email, password]);

    emit(
      state.copyWith(
        name: name,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
        isValid: isValid,
        hasSubmitted: true,
      ),
    );

    if (!isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final registerReq = RegisterReqDto(
      email: email.value,
      password: password.value,
    );
    final result = await registerUsecase.execute(registerReq);

    log.info(registerReq.toJson());
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

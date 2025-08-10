import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mockito/mockito.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/auth.dart';

import '../../../../../helper/mock.mocks.dart';

void main() {
  late LoginBloc loginBloc;
  late MockLoginUsecase mockLoginUsecase;

  setUp(() {
    mockLoginUsecase = MockLoginUsecase();
    loginBloc = LoginBloc(loginUsecase: mockLoginUsecase);
  });

  tearDown(() {
    loginBloc.close();
  });

  group('LoginBloc', () {
    const testEmail = 'test@example.com';
    const testPassword = 'password123';
    final testLoginReq = LoginReqDto(email: testEmail, password: testPassword);
    final testLoginModel = Login(token: 'test_token');

    test('initial state should be LoginState with default values', () {
      expect(loginBloc.state, const LoginState());
    });

    blocTest<LoginBloc, LoginState>(
      'emits state with updated email when LoginOnEmailChanged is added',
      build: () => loginBloc,
      act: (bloc) => bloc.add(LoginEvent.onEmailChanged(testEmail)),
      expect: () => [
        LoginState(
          email: Email.dirty(testEmail),
          isValid: false, // password is still pure
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits state with updated password when LoginOnPasswordChanged is added',
      build: () => loginBloc,
      act: (bloc) => bloc.add(LoginEvent.onPasswordChanged(testPassword)),
      expect: () => [
        LoginState(
          password: Password.dirty(testPassword),
          isValid: false, // email is still pure
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits state with isValid true when both email and password are valid',
      build: () => loginBloc,
      act: (bloc) {
        bloc.add(LoginEvent.onEmailChanged(testEmail));
        bloc.add(LoginEvent.onPasswordChanged(testPassword));
      },
      expect: () => [
        LoginState(email: Email.dirty(testEmail), isValid: false),
        LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits state with failure status when login fails',
      build: () {
        when(
          mockLoginUsecase.execute(testLoginReq),
        ).thenAnswer((_) async => Left(ServerFailure(message: 'Server error')));
        return loginBloc;
      },
      act: (bloc) async {
        bloc.add(LoginEvent.onEmailChanged(testEmail));
        await bloc.stream.firstWhere((s) => s.email.value == testEmail);

        bloc.add(LoginEvent.onPasswordChanged(testPassword));
        await bloc.stream.firstWhere((s) => s.password.value == testPassword);

        bloc.add(LoginEvent.onLogin());
      },
      expect: () => [
        LoginState(email: Email.dirty(testEmail), isValid: false),
        LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
        ),
        LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
        ),
        LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
          status: FormzSubmissionStatus.inProgress,
        ),
        LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
          status: FormzSubmissionStatus.failure,
          errorMessage: 'Server error',
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits state with success status when login succeeds',
      build: () {
        when(
          mockLoginUsecase.execute(testLoginReq),
        ).thenAnswer((_) async => Right(testLoginModel));
        return loginBloc;
      },
      act: (bloc) async {
        bloc.add(LoginEvent.onEmailChanged(testEmail));

        await bloc.stream.firstWhere((s) => s.email.value == testEmail);
        bloc.add(LoginEvent.onPasswordChanged(testPassword));

        await bloc.stream.firstWhere((s) => s.password.value == testPassword);
        bloc.add(LoginEvent.onLogin());
      },
      expect: () => [
        LoginState(email: Email.dirty(testEmail), isValid: false),
        LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
        ),
        LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
        ),
        LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
          status: FormzSubmissionStatus.inProgress,
        ),
        LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
          status: FormzSubmissionStatus.success,
          errorMessage: null,
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'does not call login usecase when form is invalid',
      build: () => loginBloc,
      act: (bloc) async {
        bloc.add(LoginEvent.onLogin());
      },
      expect: () => [
        LoginState(
          email: Email.dirty(''),
          password: Password.dirty(''),
          isValid: false,
          hasSubmitted: true,
        ),
      ],
      verify: (_) {
        verifyNever(mockLoginUsecase.execute(any));
      },
    );

    blocTest<LoginBloc, LoginState>(
      'emits state with error cleared when LoginOnError is added',
      build: () => loginBloc,
      seed: () => LoginState(
        status: FormzSubmissionStatus.failure,
        errorMessage: 'Previous error',
      ),
      act: (bloc) => bloc.add(LoginEvent.onError()),
      expect: () => [
        LoginState(status: FormzSubmissionStatus.failure, errorMessage: null),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits state with NetworkFailure when login fails with network error',
      build: () {
        when(mockLoginUsecase.execute(testLoginReq)).thenAnswer(
          (_) async => Left(NetworkFailure(message: 'Network error')),
        );
        return loginBloc;
      },
      act: (bloc) async {
        bloc.add(LoginEvent.onEmailChanged(testEmail));

        await bloc.stream.firstWhere((s) => s.email.value == testEmail);
        bloc.add(LoginEvent.onPasswordChanged(testPassword));

        await bloc.stream.firstWhere((s) => s.password.value == testPassword);
        bloc.add(LoginEvent.onLogin());
      },
      expect: () => [
        LoginState(email: Email.dirty(testEmail), isValid: false),
        LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
        ),
        LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
        ),
        LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
          status: FormzSubmissionStatus.inProgress,
        ),
        LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
          status: FormzSubmissionStatus.failure,
          errorMessage: 'Network error',
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits state with UnauthorizedFailure when login fails with unauthorized error',
      build: () {
        when(mockLoginUsecase.execute(testLoginReq)).thenAnswer(
          (_) async => Left(UnauthorizedFailure(message: 'Unauthorized')),
        );
        return loginBloc;
      },
      act: (bloc) async {
        bloc.add(LoginEvent.onEmailChanged(testEmail));

        await bloc.stream.firstWhere((s) => s.email.value == testEmail);
        bloc.add(LoginEvent.onPasswordChanged(testPassword));

        await bloc.stream.firstWhere((s) => s.password.value == testPassword);
        bloc.add(LoginEvent.onLogin());
      },
      expect: () => [
        LoginState(email: Email.dirty(testEmail), isValid: false),
        LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
        ),
        LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
        ),
        LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
          status: FormzSubmissionStatus.inProgress,
        ),
        LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
          status: FormzSubmissionStatus.failure,
          errorMessage: 'Unauthorized',
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'handles invalid email format',
      build: () => loginBloc,
      act: (bloc) => bloc.add(LoginEvent.onEmailChanged('invalid-email')),
      expect: () => [
        LoginState(email: Email.dirty('invalid-email'), isValid: false),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'handles empty password',
      build: () => loginBloc,
      act: (bloc) => bloc.add(LoginEvent.onPasswordChanged('')),
      expect: () => [LoginState(password: Password.dirty(''), isValid: false)],
    );

    blocTest<LoginBloc, LoginState>(
      'handles short password',
      build: () => loginBloc,
      act: (bloc) => bloc.add(LoginEvent.onPasswordChanged('123')),
      expect: () => [
        LoginState(password: Password.dirty('123'), isValid: false),
      ],
    );
  });
}
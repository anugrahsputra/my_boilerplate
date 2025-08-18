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
    const testLoginReq = LoginReqDto(email: testEmail, password: testPassword);
    const testLoginModel = Login(token: 'test_token');

    test('initial state should be LoginState with default values', () {
      expect(loginBloc.state, const LoginState());
    });

    blocTest<LoginBloc, LoginState>(
      'emits state with updated email when LoginOnEmailChanged is added',
      build: () => loginBloc,
      act: (bloc) => bloc.add(const LoginEvent.onEmailChanged(testEmail)),
      expect: () => [
        const LoginState(
          email: Email.dirty(testEmail),
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits state with updated password when LoginOnPasswordChanged is added',
      build: () => loginBloc,
      act: (bloc) => bloc.add(const LoginEvent.onPasswordChanged(testPassword)),
      expect: () => [
        const LoginState(
          password: Password.dirty(testPassword),
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits state with isValid true when both email and password are valid',
      build: () => loginBloc,
      act: (bloc) {
        bloc.add(const LoginEvent.onEmailChanged(testEmail));
        bloc.add(const LoginEvent.onPasswordChanged(testPassword));
      },
      expect: () => [
        const LoginState(email: Email.dirty(testEmail)),
        const LoginState(
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
        ).thenAnswer((_) async => const Left(ServerFailure(message: 'Server error')));
        return loginBloc;
      },
      act: (bloc) async {
        bloc.add(const LoginEvent.onEmailChanged(testEmail));
        await bloc.stream.firstWhere((s) => s.email.value == testEmail);

        bloc.add(const LoginEvent.onPasswordChanged(testPassword));
        await bloc.stream.firstWhere((s) => s.password.value == testPassword);

        bloc.add(const LoginEvent.onLogin());
      },
      expect: () => [
        const LoginState(email: Email.dirty(testEmail)),
        const LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
        ),
        const LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
        ),
        const LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
          status: FormzSubmissionStatus.inProgress,
        ),
        const LoginState(
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
        ).thenAnswer((_) async => const Right(testLoginModel));
        return loginBloc;
      },
      act: (bloc) async {
        bloc.add(const LoginEvent.onEmailChanged(testEmail));

        await bloc.stream.firstWhere((s) => s.email.value == testEmail);
        bloc.add(const LoginEvent.onPasswordChanged(testPassword));

        await bloc.stream.firstWhere((s) => s.password.value == testPassword);
        bloc.add(const LoginEvent.onLogin());
      },
      expect: () => [
        const LoginState(email: Email.dirty(testEmail)),
        const LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
        ),
        const LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
        ),
        const LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
          status: FormzSubmissionStatus.inProgress,
        ),
        const LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
          status: FormzSubmissionStatus.success,
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'does not call login usecase when form is invalid',
      build: () => loginBloc,
      act: (bloc) async {
        bloc.add(const LoginEvent.onLogin());
      },
      expect: () => [
        const LoginState(
          email: Email.dirty(),
          password: Password.dirty(),
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
      seed: () => const LoginState(
        status: FormzSubmissionStatus.failure,
        errorMessage: 'Previous error',
      ),
      act: (bloc) => bloc.add(const LoginEvent.onError()),
      expect: () => [
        const LoginState(status: FormzSubmissionStatus.failure),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits state with NetworkFailure when login fails with network error',
      build: () {
        when(mockLoginUsecase.execute(testLoginReq)).thenAnswer(
          (_) async => const Left(NetworkFailure(message: 'Network error')),
        );
        return loginBloc;
      },
      act: (bloc) async {
        bloc.add(const LoginEvent.onEmailChanged(testEmail));

        await bloc.stream.firstWhere((s) => s.email.value == testEmail);
        bloc.add(const LoginEvent.onPasswordChanged(testPassword));

        await bloc.stream.firstWhere((s) => s.password.value == testPassword);
        bloc.add(const LoginEvent.onLogin());
      },
      expect: () => [
        const LoginState(email: Email.dirty(testEmail)),
        const LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
        ),
        const LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
        ),
        const LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
          status: FormzSubmissionStatus.inProgress,
        ),
        const LoginState(
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
          (_) async => const Left(UnauthorizedFailure(message: 'Unauthorized')),
        );
        return loginBloc;
      },
      act: (bloc) async {
        bloc.add(const LoginEvent.onEmailChanged(testEmail));

        await bloc.stream.firstWhere((s) => s.email.value == testEmail);
        bloc.add(const LoginEvent.onPasswordChanged(testPassword));

        await bloc.stream.firstWhere((s) => s.password.value == testPassword);
        bloc.add(const LoginEvent.onLogin());
      },
      expect: () => [
        const LoginState(email: Email.dirty(testEmail)),
        const LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
        ),
        const LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
        ),
        const LoginState(
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
          status: FormzSubmissionStatus.inProgress,
        ),
        const LoginState(
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
      act: (bloc) => bloc.add(const LoginEvent.onEmailChanged('invalid-email')),
      expect: () => [
        const LoginState(email: Email.dirty('invalid-email')),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'handles empty password',
      build: () => loginBloc,
      act: (bloc) => bloc.add(const LoginEvent.onPasswordChanged('')),
      expect: () => [const LoginState(password: Password.dirty())],
    );

    blocTest<LoginBloc, LoginState>(
      'handles short password',
      build: () => loginBloc,
      act: (bloc) => bloc.add(const LoginEvent.onPasswordChanged('123')),
      expect: () => [
        const LoginState(password: Password.dirty('123')),
      ],
    );
  });
}
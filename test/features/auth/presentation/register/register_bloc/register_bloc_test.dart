import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mockito/mockito.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/auth.dart';

import '../../../../../helper/mock.mocks.dart';

void main() {
  late RegisterBloc registerBloc;
  late MockRegisterUsecase mockRegisterUsecase;

  setUp(() {
    mockRegisterUsecase = MockRegisterUsecase();
    registerBloc = RegisterBloc(registerUsecase: mockRegisterUsecase);
  });

  tearDown(() {
    registerBloc.close();
  });

  group('RegisterBloc', () {
    const testName = 'John Doe';
    const testPhoneNumber = '081234567890';
    const testEmail = 'test@example.com';
    const testPassword = 'password123';
    const testRegisterReq = RegisterReqDto(
      email: testEmail,
      password: testPassword,
    );
    const testRegisterModel = Register(id: 1, token: 'test_token');

    test('initial state should be RegisterState with default values', () {
      expect(registerBloc.state, const RegisterState());
    });

    blocTest<RegisterBloc, RegisterState>(
      'emits state with updated email when RegisterOnEmailChanged is added',
      build: () => registerBloc,
      act: (bloc) => bloc.add(const RegisterEvent.onEmailChanged(testEmail)),
      expect: () => [
        const RegisterState(
          email: Email.dirty(testEmail),
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits state with updated password when RegisterOnPasswordChanged is added',
      build: () => registerBloc,
      act: (bloc) => bloc.add(const RegisterEvent.onPasswordChanged(testPassword)),
      expect: () => [
        const RegisterState(
          password: Password.dirty(testPassword),
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits state with isValid true when all fields are valid',
      build: () => registerBloc,
      act: (bloc) {
        bloc.add(const RegisterEvent.onNameChanged('John Doe'));
        bloc.add(const RegisterEvent.onPhoneChanged('+1234567890'));
        bloc.add(const RegisterEvent.onEmailChanged(testEmail));
        bloc.add(const RegisterEvent.onPasswordChanged(testPassword));
      },
      expect: () => [
        const RegisterState(name: Name.dirty('John Doe')),
        const RegisterState(
          name: Name.dirty('John Doe'),
          phoneNumber: PhoneNumber.dirty('+1234567890'),
        ),
        const RegisterState(
          name: Name.dirty('John Doe'),
          phoneNumber: PhoneNumber.dirty('+1234567890'),
          email: Email.dirty(testEmail),
        ),
        const RegisterState(
          name: Name.dirty('John Doe'),
          phoneNumber: PhoneNumber.dirty('+1234567890'),
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits state with failure status when register fails',
      build: () {
        when(
          mockRegisterUsecase.execute(testRegisterReq),
        ).thenAnswer((_) async => const Left(ServerFailure(message: 'Server error')));
        return registerBloc;
      },
      act: (bloc) async {
        bloc.add(const RegisterEvent.onNameChanged(testName));
        await bloc.stream.firstWhere((s) => s.name.value == testName);

        bloc.add(const RegisterEvent.onPhoneChanged(testPhoneNumber));
        await bloc.stream.firstWhere(
          (s) => s.phoneNumber.value == testPhoneNumber,
        );

        bloc.add(const RegisterEvent.onEmailChanged(testEmail));
        await bloc.stream.firstWhere((s) => s.email.value == testEmail);

        bloc.add(const RegisterEvent.onPasswordChanged(testPassword));
        await bloc.stream.firstWhere((s) => s.password.value == testPassword);
        bloc.add(const RegisterEvent.onRegister());
      },
      expect: () => [
        const RegisterState(name: Name.dirty(testName)),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
          status: FormzSubmissionStatus.inProgress,
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
          status: FormzSubmissionStatus.failure,
          errorMessage: 'Server error',
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits state with success status when register succeeds',
      build: () {
        when(
          mockRegisterUsecase.execute(testRegisterReq),
        ).thenAnswer((_) async => const Right(testRegisterModel));
        return registerBloc;
      },
      act: (bloc) {
        bloc.add(const RegisterEvent.onNameChanged(testName));
        bloc.add(const RegisterEvent.onPhoneChanged(testPhoneNumber));
        bloc.add(const RegisterEvent.onEmailChanged(testEmail));
        bloc.add(const RegisterEvent.onPasswordChanged(testPassword));
        bloc.add(const RegisterEvent.onRegister());
      },
      expect: () => [
        const RegisterState(name: Name.dirty(testName)),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
          status: FormzSubmissionStatus.inProgress,
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
          status: FormzSubmissionStatus.success,
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'does not call register usecase when form is invalid',
      build: () => registerBloc,
      act: (bloc) => bloc.add(const RegisterEvent.onRegister()),
      expect: () => [
        const RegisterState(
          name: Name.dirty(),
          phoneNumber: PhoneNumber.dirty(),
          email: Email.dirty(),
          password: Password.dirty(),
          hasSubmitted: true,
        ),
      ],
      verify: (_) {
        verifyNever(mockRegisterUsecase.execute(any));
      },
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits state with error cleared when RegisterOnError is added',
      build: () => registerBloc,
      seed: () => const RegisterState(
        status: FormzSubmissionStatus.failure,
        errorMessage: 'Previous error',
      ),
      act: (bloc) => bloc.add(const RegisterEvent.onError()),
      expect: () => [
        const RegisterState(
          status: FormzSubmissionStatus.failure,
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits state with NetworkFailure when register fails with network error',
      build: () {
        when(mockRegisterUsecase.execute(testRegisterReq)).thenAnswer(
          (_) async => const Left(NetworkFailure(message: 'Network error')),
        );
        return registerBloc;
      },
      act: (bloc) {
        bloc.add(const RegisterEvent.onNameChanged(testName));
        bloc.add(const RegisterEvent.onPhoneChanged(testPhoneNumber));
        bloc.add(const RegisterEvent.onEmailChanged(testEmail));
        bloc.add(const RegisterEvent.onPasswordChanged(testPassword));
        bloc.add(const RegisterEvent.onRegister());
      },
      expect: () => [
        const RegisterState(name: Name.dirty(testName)),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
          status: FormzSubmissionStatus.inProgress,
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
          status: FormzSubmissionStatus.failure,
          errorMessage: 'Network error',
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits state with UnauthorizedFailure when register fails with unauthorized error',
      build: () {
        when(mockRegisterUsecase.execute(testRegisterReq)).thenAnswer(
          (_) async => const Left(UnauthorizedFailure(message: 'Unauthorized')),
        );
        return registerBloc;
      },
      act: (bloc) {
        bloc.add(const RegisterEvent.onNameChanged(testName));
        bloc.add(const RegisterEvent.onPhoneChanged(testPhoneNumber));
        bloc.add(const RegisterEvent.onEmailChanged(testEmail));
        bloc.add(const RegisterEvent.onPasswordChanged(testPassword));
        bloc.add(const RegisterEvent.onRegister());
      },
      expect: () => [
        const RegisterState(name: Name.dirty(testName)),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
          status: FormzSubmissionStatus.inProgress,
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
          status: FormzSubmissionStatus.failure,
          errorMessage: 'Unauthorized',
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'handles invalid email format',
      build: () => registerBloc,
      act: (bloc) => bloc.add(const RegisterEvent.onEmailChanged('invalid-email')),
      expect: () => [
        const RegisterState(email: Email.dirty('invalid-email')),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'handles empty password',
      build: () => registerBloc,
      act: (bloc) => bloc.add(const RegisterEvent.onPasswordChanged('')),
      expect: () => [
        const RegisterState(password: Password.dirty()),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'handles short password',
      build: () => registerBloc,
      act: (bloc) => bloc.add(const RegisterEvent.onPasswordChanged('123')),
      expect: () => [
        const RegisterState(password: Password.dirty('123')),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'handles different user IDs in successful registration',
      build: () {
        const registerModelWithId = Register(id: 999, token: 'high_id_token');
        when(
          mockRegisterUsecase.execute(testRegisterReq),
        ).thenAnswer((_) async => const Right(registerModelWithId));
        return registerBloc;
      },
      act: (bloc) {
        bloc.add(const RegisterEvent.onNameChanged(testName));
        bloc.add(const RegisterEvent.onPhoneChanged(testPhoneNumber));
        bloc.add(const RegisterEvent.onEmailChanged(testEmail));
        bloc.add(const RegisterEvent.onPasswordChanged(testPassword));
        bloc.add(const RegisterEvent.onRegister());
      },
      expect: () => [
        const RegisterState(name: Name.dirty(testName)),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
          status: FormzSubmissionStatus.inProgress,
        ),
        const RegisterState(
          name: Name.dirty(testName),
          phoneNumber: PhoneNumber.dirty(testPhoneNumber),
          email: Email.dirty(testEmail),
          password: Password.dirty(testPassword),
          isValid: true,
          hasSubmitted: true,
          status: FormzSubmissionStatus.success,
        ),
      ],
    );
  });
}
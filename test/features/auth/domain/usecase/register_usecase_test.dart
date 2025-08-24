import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/auth.dart';

import '../../../../helper/mock.mocks.dart';

void main() {
  late RegisterUsecase registerUsecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    registerUsecase = RegisterUsecase(repository: mockAuthRepository);
  });

  group('RegisterUsecase', () {
    const testEmail = 'test@example.com';
    const testPassword = 'password123';
    const testRegisterReq = RegisterReqDto(
      email: testEmail,
      password: testPassword,
    );
    const testRegisterModel = Register(id: 1, token: 'test_token');

    test(
      'should return Register model when repository call is successful',
      () async {
        // arrange
        when(
          mockAuthRepository.register(testRegisterReq),
        ).thenAnswer((_) async => const Right(testRegisterModel));

        // act
        final result = await registerUsecase.execute(testRegisterReq);

        // assert
        expect(result, const Right(testRegisterModel));
        verify(mockAuthRepository.register(testRegisterReq));
        verifyNoMoreInteractions(mockAuthRepository);
      },
    );

    test('should return ServerFailure when repository call fails', () async {
      // arrange
      const serverFailure = ServerFailure(message: 'Server error');
      when(
        mockAuthRepository.register(testRegisterReq),
      ).thenAnswer((_) async => const Left(serverFailure));

      // act
      final result = await registerUsecase.execute(testRegisterReq);

      // assert
      expect(result, const Left(serverFailure));
      verify(mockAuthRepository.register(testRegisterReq));
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test(
      'should return NetworkFailure when repository call fails with network error',
      () async {
        // arrange
        const networkFailure = NetworkFailure(message: 'Network error');
        when(
          mockAuthRepository.register(testRegisterReq),
        ).thenAnswer((_) async => const Left(networkFailure));

        // act
        final result = await registerUsecase.execute(testRegisterReq);

        // assert
        expect(result, const Left(networkFailure));
        verify(mockAuthRepository.register(testRegisterReq));
        verifyNoMoreInteractions(mockAuthRepository);
      },
    );

    test(
      'should return UnauthorizedFailure when repository call fails with unauthorized error',
      () async {
        // arrange
        const unauthorizedFailure = UnauthorizedFailure(
          message: 'Unauthorized',
        );
        when(
          mockAuthRepository.register(testRegisterReq),
        ).thenAnswer((_) async => const Left(unauthorizedFailure));

        // act
        final result = await registerUsecase.execute(testRegisterReq);

        // assert
        expect(result, const Left(unauthorizedFailure));
        verify(mockAuthRepository.register(testRegisterReq));
        verifyNoMoreInteractions(mockAuthRepository);
      },
    );

    test(
      'should return CacheFailure when repository call fails with cache error',
      () async {
        // arrange
        const cacheFailure = CacheFailure(message: 'Cache error');
        when(
          mockAuthRepository.register(testRegisterReq),
        ).thenAnswer((_) async => const Left(cacheFailure));

        // act
        final result = await registerUsecase.execute(testRegisterReq);

        // assert
        expect(result, const Left(cacheFailure));
        verify(mockAuthRepository.register(testRegisterReq));
        verifyNoMoreInteractions(mockAuthRepository);
      },
    );

    test(
      'should return UnknownFailure when repository call fails with unknown error',
      () async {
        // arrange
        const unknownFailure = Failure.failure(message: 'Unknown error');
        when(
          mockAuthRepository.register(testRegisterReq),
        ).thenAnswer((_) async => const Left(unknownFailure));

        // act
        final result = await registerUsecase.execute(testRegisterReq);

        // assert
        expect(result, const Left(unknownFailure));
        verify(mockAuthRepository.register(testRegisterReq));
        verifyNoMoreInteractions(mockAuthRepository);
      },
    );

    test('should handle different email and password combinations', () async {
      // arrange
      const differentEmail = 'different@example.com';
      const differentPassword = 'different123';
      const differentRegisterReq = RegisterReqDto(
        email: differentEmail,
        password: differentPassword,
      );
      const differentRegisterModel = Register(id: 2, token: 'different_token');

      when(
        mockAuthRepository.register(differentRegisterReq),
      ).thenAnswer((_) async => const Right(differentRegisterModel));

      // act
      final result = await registerUsecase.execute(differentRegisterReq);

      // assert
      expect(result, const Right(differentRegisterModel));
      verify(mockAuthRepository.register(differentRegisterReq));
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should handle empty email and password', () async {
      // arrange
      const emptyEmail = '';
      const emptyPassword = '';
      const emptyRegisterReq = RegisterReqDto(
        email: emptyEmail,
        password: emptyPassword,
      );
      const emptyRegisterModel = Register(id: 3, token: 'empty_token');

      when(
        mockAuthRepository.register(emptyRegisterReq),
      ).thenAnswer((_) async => const Right(emptyRegisterModel));

      // act
      final result = await registerUsecase.execute(emptyRegisterReq);

      // assert
      expect(result, const Right(emptyRegisterModel));
      verify(mockAuthRepository.register(emptyRegisterReq));
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should handle different user IDs', () async {
      // arrange
      const registerReqWithId = RegisterReqDto(
        email: testEmail,
        password: testPassword,
      );
      const registerModelWithId = Register(id: 999, token: 'high_id_token');

      when(
        mockAuthRepository.register(registerReqWithId),
      ).thenAnswer((_) async => const Right(registerModelWithId));

      // act
      final result = await registerUsecase.execute(registerReqWithId);

      // assert
      expect(result, const Right<Failure, Register>(registerModelWithId));
      expect(result.fold((failure) => null, (success) => success.id), 999);
      verify(mockAuthRepository.register(registerReqWithId));
      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}

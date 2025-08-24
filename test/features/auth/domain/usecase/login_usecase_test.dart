import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/auth.dart';

import '../../../../helper/mock.mocks.dart';

void main() {
  late LoginUsecase loginUsecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUsecase = LoginUsecase(repository: mockAuthRepository);
  });

  group('LoginUsecase', () {
    const testEmail = 'test@example.com';
    const testPassword = 'password123';
    const testLoginReq = LoginReqDto(email: testEmail, password: testPassword);
    const testLoginModel = Login(token: 'test_token');

    test(
      'should return Login model when repository call is successful',
      () async {
        // arrange
        when(
          mockAuthRepository.login(testLoginReq),
        ).thenAnswer((_) async => const Right(testLoginModel));

        // act
        final result = await loginUsecase.execute(testLoginReq);

        // assert
        expect(result, const Right(testLoginModel));
        verify(mockAuthRepository.login(testLoginReq));
        verifyNoMoreInteractions(mockAuthRepository);
      },
    );

    test('should return ServerFailure when repository call fails', () async {
      // arrange
      const serverFailure = ServerFailure(message: 'Server error');
      when(
        mockAuthRepository.login(testLoginReq),
      ).thenAnswer((_) async => const Left(serverFailure));

      // act
      final result = await loginUsecase.execute(testLoginReq);

      // assert
      expect(result, const Left(serverFailure));
      verify(mockAuthRepository.login(testLoginReq));
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test(
      'should return NetworkFailure when repository call fails with network error',
      () async {
        // arrange
        const networkFailure = NetworkFailure(message: 'Network error');
        when(
          mockAuthRepository.login(testLoginReq),
        ).thenAnswer((_) async => const Left(networkFailure));

        // act
        final result = await loginUsecase.execute(testLoginReq);

        // assert
        expect(result, const Left(networkFailure));
        verify(mockAuthRepository.login(testLoginReq));
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
          mockAuthRepository.login(testLoginReq),
        ).thenAnswer((_) async => const Left(unauthorizedFailure));

        // act
        final result = await loginUsecase.execute(testLoginReq);

        // assert
        expect(result, const Left(unauthorizedFailure));
        verify(mockAuthRepository.login(testLoginReq));
        verifyNoMoreInteractions(mockAuthRepository);
      },
    );

    test(
      'should return CacheFailure when repository call fails with cache error',
      () async {
        // arrange
        const cacheFailure = CacheFailure(message: 'Cache error');
        when(
          mockAuthRepository.login(testLoginReq),
        ).thenAnswer((_) async => const Left(cacheFailure));

        // act
        final result = await loginUsecase.execute(testLoginReq);

        // assert
        expect(result, const Left(cacheFailure));
        verify(mockAuthRepository.login(testLoginReq));
        verifyNoMoreInteractions(mockAuthRepository);
      },
    );

    test(
      'should return UnknownFailure when repository call fails with unknown error',
      () async {
        // arrange
        const unknownFailure = Failure.failure(message: 'Unknown error');
        when(
          mockAuthRepository.login(testLoginReq),
        ).thenAnswer((_) async => const Left(unknownFailure));

        // act
        final result = await loginUsecase.execute(testLoginReq);

        // assert
        expect(result, const Left(unknownFailure));
        verify(mockAuthRepository.login(testLoginReq));
        verifyNoMoreInteractions(mockAuthRepository);
      },
    );

    test('should handle different email and password combinations', () async {
      // arrange
      const differentEmail = 'different@example.com';
      const differentPassword = 'different123';
      const differentLoginReq = LoginReqDto(
        email: differentEmail,
        password: differentPassword,
      );
      const differentLoginModel = Login(token: 'different_token');

      when(
        mockAuthRepository.login(differentLoginReq),
      ).thenAnswer((_) async => const Right(differentLoginModel));

      // act
      final result = await loginUsecase.execute(differentLoginReq);

      // assert
      expect(result, const Right(differentLoginModel));
      verify(mockAuthRepository.login(differentLoginReq));
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should handle empty email and password', () async {
      // arrange
      const emptyEmail = '';
      const emptyPassword = '';
      const emptyLoginReq = LoginReqDto(
        email: emptyEmail,
        password: emptyPassword,
      );
      const emptyLoginModel = Login(token: 'empty_token');

      when(
        mockAuthRepository.login(emptyLoginReq),
      ).thenAnswer((_) async => const Right(emptyLoginModel));

      // act
      final result = await loginUsecase.execute(emptyLoginReq);

      // assert
      expect(result, const Right(emptyLoginModel));
      verify(mockAuthRepository.login(emptyLoginReq));
      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}

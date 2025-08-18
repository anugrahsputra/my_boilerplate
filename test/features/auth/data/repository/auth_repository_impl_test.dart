import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/auth.dart';

import '../../../../helper/mock.mocks.dart';

void main() {
  late AuthRepositoryImpl authRepository;
  late MockAuthDataSource mockAuthDataSource;
  late MockLocalStorageManager mockLocalStorageManager;

  setUp(() {
    mockAuthDataSource = MockAuthDataSource();
    mockLocalStorageManager = MockLocalStorageManager();
    authRepository = AuthRepositoryImpl(
      dataSource: mockAuthDataSource,
      localStorageManager: mockLocalStorageManager,
    );
  });

  group('AuthRepositoryImpl', () {
    const testEmail = 'test@example.com';
    const testPassword = 'password123';
    const testLoginReq = LoginReqDto(email: testEmail, password: testPassword);
    const testLoginResp = LoginRespDto(token: 'test_token');
    const testLoginModel = Login(token: 'test_token');

    group('login', () {
      test(
        'should return Login model when data source call is successful',
        () async {
          // arrange
          when(
            mockAuthDataSource.login(testLoginReq),
          ).thenAnswer((_) async => const Right(testLoginResp));
          when(
            mockLocalStorageManager.writeToStorage(
              'token',
              testLoginResp.token,
            ),
          ).thenAnswer((_) async {});

          // act
          final result = await authRepository.login(testLoginReq);

          // assert
          expect(result, const Right(testLoginModel));
          verify(mockAuthDataSource.login(testLoginReq));
          verify(
            mockLocalStorageManager.writeToStorage(any, testLoginResp.token),
          );
          verifyNoMoreInteractions(mockAuthDataSource);
          verifyNoMoreInteractions(mockLocalStorageManager);
        },
      );

      test(
        'should return ServerFailure when data source returns ServerFailure',
        () async {
          // arrange
          when(mockAuthDataSource.login(testLoginReq)).thenAnswer(
            (_) async => const Left(ServerFailure(message: 'Server error')),
          );

          // act
          final result = await authRepository.login(testLoginReq);

          // assert
          expect(result, const Left(ServerFailure(message: 'Server error')));
          verify(mockAuthDataSource.login(testLoginReq));
          verifyNoMoreInteractions(mockAuthDataSource);
          verifyNever(mockLocalStorageManager.writeToStorage(any, any));
        },
      );

      test(
        'should return NetworkFailure when data source returns NetworkFailure',
        () async {
          // arrange
          when(mockAuthDataSource.login(testLoginReq)).thenAnswer(
            (_) async => const Left(NetworkFailure(message: 'Network error')),
          );

          // act
          final result = await authRepository.login(testLoginReq);

          // assert
          expect(result, const Left(NetworkFailure(message: 'Network error')));
          verify(mockAuthDataSource.login(testLoginReq));
          verifyNoMoreInteractions(mockAuthDataSource);
          verifyNever(mockLocalStorageManager.writeToStorage(any, any));
        },
      );

      test(
        'should return UnauthorizedFailure when data source returns UnauthorizedFailure',
        () async {
          // arrange
          when(mockAuthDataSource.login(testLoginReq)).thenAnswer(
            (_) async => const Left(UnauthorizedFailure(message: 'Unauthorized')),
          );

          // act
          final result = await authRepository.login(testLoginReq);

          // assert
          expect(result, const Left(UnauthorizedFailure(message: 'Unauthorized')));
          verify(mockAuthDataSource.login(testLoginReq));
          verifyNoMoreInteractions(mockAuthDataSource);
          verifyNever(mockLocalStorageManager.writeToStorage(any, any));
        },
      );

      group('register', () {
        const testRegisterEmail = 'register@example.com';
        const testRegisterPassword = 'register123';
        const testRegisterReq = RegisterReqDto(
          email: testRegisterEmail,
          password: testRegisterPassword,
        );
        const testRegisterResp = RegisterRespDto(
          id: 2,
          token: 'register_token',
        );
        const testRegisterModel = Register(id: 2, token: 'register_token');

        test(
          'should return Register model when data source call is successful',
          () async {
            // arrange
            when(
              mockAuthDataSource.register(testRegisterReq),
            ).thenAnswer((_) async => const Right(testRegisterResp));
            when(
              mockLocalStorageManager.writeToStorage(
                any,
                testRegisterResp.token,
              ),
            ).thenAnswer((_) async => true);

            // act
            final result = await authRepository.register(testRegisterReq);

            // assert
            expect(result, const Right(testRegisterModel));
            verify(mockAuthDataSource.register(testRegisterReq));
            verifyNever(
              mockLocalStorageManager.writeToStorage(
                any,
                testRegisterResp.token,
              ),
            );
            verifyNoMoreInteractions(mockAuthDataSource);
            verifyNoMoreInteractions(mockLocalStorageManager);
          },
        );

        test(
          'should return ServerFailure when register data source returns ServerFailure',
          () async {
            // arrange
            when(mockAuthDataSource.register(testRegisterReq)).thenAnswer(
              (_) async => const Left(ServerFailure(message: 'Server error')),
            );

            // act
            final result = await authRepository.register(testRegisterReq);

            // assert
            expect(result, const Left(ServerFailure(message: 'Server error')));
            verify(mockAuthDataSource.register(testRegisterReq));
            verifyNoMoreInteractions(mockAuthDataSource);
            verifyNever(mockLocalStorageManager.writeToStorage(any, any));
          },
        );

        test(
          'should return NetworkFailure when register data source returns NetworkFailure',
          () async {
            // arrange
            when(mockAuthDataSource.register(testRegisterReq)).thenAnswer(
              (_) async => const Left(NetworkFailure(message: 'Network error')),
            );

            // act
            final result = await authRepository.register(testRegisterReq);

            // assert
            expect(result, const Left(NetworkFailure(message: 'Network error')));
            verify(mockAuthDataSource.register(testRegisterReq));
            verifyNoMoreInteractions(mockAuthDataSource);
            verifyNever(mockLocalStorageManager.writeToStorage(any, any));
          },
        );
      });
    });
  });
}
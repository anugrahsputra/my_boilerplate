import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http_cache_hive_store/http_cache_hive_store.dart';
import 'package:http_certificate_pinning/http_certificate_pinning.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:my_boilerplate/app/app_cubit.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/auth.dart';
import 'package:my_boilerplate/features/auth/data/datasource/auth_datasource.dart';
import 'package:my_boilerplate/features/general/general.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_dio/sentry_dio.dart';

final GetIt di = GetIt.instance;

Future<void> setup() async {
  unawaited(initializeDateFormatting());

  final dir = await getTemporaryDirectory();

  di
    ..registerFactory<FlutterSecureStorage>(() => const FlutterSecureStorage())
    ..registerFactory<NetworkClient>(() => NetworkClientImpl(dio: di<Dio>()))
    ..registerFactory<AppNavigator>(AppNavigator.new)
    ..registerLazySingleton<LocalStorageManager>(
      () => LocalStorageManagerImpl(storage: di<FlutterSecureStorage>()),
    )
    ..registerLazySingleton<StoreKey>(
      () => StoreKey(localStorageManager: di<LocalStorageManager>()),
    )
    /* -----------------> Network <-----------------*/
    ..registerFactory<Dio>(
      () => Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 35),
          receiveTimeout: const Duration(seconds: 35),
          sendTimeout: const Duration(seconds: 35),
        ),
      ),
      instanceName: 'interceptor',
    )
    ..registerFactory<Dio>(
      () =>
          Dio(
              BaseOptions(
                connectTimeout: const Duration(seconds: 35),
                receiveTimeout: const Duration(seconds: 35),
                sendTimeout: const Duration(seconds: 35),
              ),
            )
            ..addSentry(captureFailedRequests: true)
            ..interceptors.addAll([
              NetworkInterceptor(),
              CertificatePinningInterceptor(
                allowedSHAFingerprints: ShaFingerprints.allowedSHAFingerprints,
              ),
              DioCacheInterceptor(
                options: CacheOptions(
                  store: HiveCacheStore(dir.path),
                  priority: CachePriority.high,
                  policy: CachePolicy.forceCache,
                  maxStale: const Duration(days: 7),
                  cipher: CacheCipher(
                    encrypt: (byte) async {
                      final key = await di<StoreKey>().getStoredKey();
                      final iv = encrypt.IV.fromSecureRandom(16);
                      final encrypter = encrypt.Encrypter(
                        encrypt.AES(encrypt.Key.fromUtf8(key)),
                      );
                      final encrypted = encrypter.encryptBytes(
                        Uint8List.fromList(byte),
                        iv: iv,
                      );
                      return [...iv.bytes, ...encrypted.bytes];
                    },
                    decrypt: (byte) async {
                      final key = await di<StoreKey>().getStoredKey();
                      final iv = encrypt.IV(
                        Uint8List.fromList(byte.sublist(0, 16)),
                      );
                      final encryptedData = Uint8List.fromList(
                        byte.sublist(16),
                      );
                      final encrypter = encrypt.Encrypter(
                        encrypt.AES(encrypt.Key.fromUtf8(key)),
                      );
                      final encrypted = encrypt.Encrypted(encryptedData);
                      final decryptedBytes = encrypter.decryptBytes(
                        encrypted,
                        iv: iv,
                      );
                      return decryptedBytes;
                    },
                  ),
                ),
              ),
            ]),
    )
    /* -----------------> App <-----------------*/
    ..registerFactory<AppCubit>(
      () => AppCubit(localStorageManager: di<LocalStorageManager>()),
    );

  _authLocator();
  _mainLocator();
}

void _authLocator() {
  di
    ..registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl(dioClient: di<NetworkClient>()),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        dataSource: di<AuthDataSource>(),
        localStorageManager: di<LocalStorageManager>(),
      ),
    )
    ..registerLazySingleton<LoginUsecase>(
      () => LoginUsecase(repository: di<AuthRepository>()),
    )
    ..registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecase(repository: di<AuthRepository>()),
    )
    ..registerFactory<LoginBloc>(
      () => LoginBloc(loginUsecase: di<LoginUsecase>()),
    )
    ..registerFactory<RegisterBloc>(
      () => RegisterBloc(registerUsecase: di<RegisterUsecase>()),
    );
}

void _mainLocator() {
  di.registerFactory<MainCubit>(MainCubit.new);
}

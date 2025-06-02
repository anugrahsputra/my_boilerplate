import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';
import 'package:my_boilerplate/core/core.dart';

final di = GetIt.instance;

Future<void> setup() async {
  initializeDateFormatting();

  var dir = await getTemporaryDirectory();

  /* -----------------> Network <-----------------*/
  di.registerFactory<Dio>(
        () => Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 35),
        receiveTimeout: const Duration(seconds: 35),
        sendTimeout: const Duration(seconds: 35),
      ),
    ),
    instanceName: "interceptor",
  );
  di.registerFactory<Dio>(
        () => Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 35),
        receiveTimeout: const Duration(seconds: 35),
        sendTimeout: const Duration(seconds: 35),
      ),
    )..interceptors.addAll([
      NetworkInterceptor(),
      DioCacheInterceptor(
        options: CacheOptions(
          store: HiveCacheStore(dir.path, hiveBoxName: 'qurani'),
          priority: CachePriority.high,
          policy: CachePolicy.forceCache,
          maxStale: const Duration(days: 7),
          hitCacheOnErrorExcept: [],
        ),
      ),
    ]),
  );
}
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:my_boilerplate/core/core.dart';

export 'mock.mocks.dart';

@GenerateNiceMocks([
  /* core/data */
  MockSpec<ApiEndpoints>(),
  MockSpec<NetworkClient>(),
  MockSpec<NetworkInterceptor>(),
  MockSpec<NetworkRequestRetrier>(),
  MockSpec<IsolateParser>(),
  MockSpec<Dio>(),
  MockSpec<InternetConnectionChecker>(),
  MockSpec<RequestInterceptorHandler>(),
  MockSpec<ResponseInterceptorHandler>(),
  MockSpec<ErrorInterceptorHandler>(),
])
void main(List<String> args) {}


import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/data/datasource/auth_datasource.dart';
import 'package:my_boilerplate/features/auth/domain/repository/auth_repository.dart';
import 'package:my_boilerplate/features/auth/domain/usecase/login_usecase.dart';
import 'package:my_boilerplate/features/auth/domain/usecase/register_usecase.dart';

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
  MockSpec<LocalStorageManager>(),


  /* features/data */

  MockSpec<AuthDataSource>(),
  MockSpec<AuthRepository>(),
  MockSpec<LoginUsecase>(),
  MockSpec<RegisterUsecase>(),
])
void main(List<String> args) {}
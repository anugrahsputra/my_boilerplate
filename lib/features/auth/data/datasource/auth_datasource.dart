import 'package:dartz/dartz.dart';
import 'package:logging/logging.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/data/data.dart';

abstract class AuthDataSource {
  Future<Either<Failure, LoginRespDto>> login(LoginReqDto loginReq);

  Future<Either<Failure, RegisterRespDto>> register(RegisterReqDto registerReq);
}

class AuthDataSourceImpl implements AuthDataSource {

  AuthDataSourceImpl({required this.dioClient});
  final NetworkClient dioClient;
  final Logger log = Logger('Auth Data Source');

  @override
  Future<Either<Failure, LoginRespDto>> login(LoginReqDto loginReq) async {
    return dioClient.postParsedSafe<LoginRespDto>(
      ApiEndpoints.login,
      data: loginReq.toJson(),
      converter: LoginRespDto.fromJson,
    );
  }

  @override
  Future<Either<Failure, RegisterRespDto>> register(
    RegisterReqDto registerReq,
  ) async {
    return dioClient.postParsedSafe<RegisterRespDto>(
      ApiEndpoints.register,
      data: registerReq.toJson(),
      converter: RegisterRespDto.fromJson,
    );
  }
}

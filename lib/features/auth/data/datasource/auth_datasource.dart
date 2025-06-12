import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/data/data.dart';

abstract class AuthDataSource {
  Future<LoginRespDto> login(LoginReqDto loginReq);

  Future<RegisterRespDto> register(RegisterReqDto registerReq);
}

class AuthDataSourceImpl implements AuthDataSource {
  final NetworkClient dioClient;

  AuthDataSourceImpl({required this.dioClient});

  @override
  Future<LoginRespDto> login(LoginReqDto loginReq) async {
    final response = await dioClient.post(
      ApiEndpoints.login,
      data: loginReq.toJson(),
    );

    return LoginRespDto.fromJson(response.data);
  }

  @override
  Future<RegisterRespDto> register(RegisterReqDto registerReq) async {
    final response = await dioClient.post(
      ApiEndpoints.register,
      data: registerReq.toJson(),
    );

    return RegisterRespDto.fromJson(response.data);
  }
}
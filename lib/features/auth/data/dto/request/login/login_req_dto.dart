import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_req_dto.freezed.dart';

part 'login_req_dto.g.dart';

@freezed
abstract class LoginReqDto with _$LoginReqDto {
  @JsonSerializable(explicitToJson: true)
  const factory LoginReqDto({required String email, required String password}) =
      _LoginReqDto;

  factory LoginReqDto.fromJson(Map<String, dynamic> json) =>
      _$LoginReqDtoFromJson(json);
}

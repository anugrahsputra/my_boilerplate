import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_resp_dto.freezed.dart';

part 'login_resp_dto.g.dart';

@freezed
abstract class LoginRespDto with _$LoginRespDto {
  @JsonSerializable(explicitToJson: true)
  const factory LoginRespDto({required String token}) = _LoginRespDto;

  factory LoginRespDto.fromJson(Map<String, dynamic> json) =>
      _$LoginRespDtoFromJson(json);
}

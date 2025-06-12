import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_resp_dto.freezed.dart';

part 'register_resp_dto.g.dart';

@freezed
abstract class RegisterRespDto with _$RegisterRespDto {
  @JsonSerializable(explicitToJson: true)
  const factory RegisterRespDto({required int id, required String token}) =
      _RegisterRespDto;

  factory RegisterRespDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterRespDtoFromJson(json);
}
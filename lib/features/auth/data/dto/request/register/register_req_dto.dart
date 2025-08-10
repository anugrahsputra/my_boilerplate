import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_req_dto.freezed.dart';
part 'register_req_dto.g.dart';

@freezed
abstract class RegisterReqDto with _$RegisterReqDto {
  @JsonSerializable(explicitToJson: true)
  const factory RegisterReqDto({
    required String email,
    required String password,
  }) = _RegisterReqDto;

  factory RegisterReqDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterReqDtoFromJson(json);
}

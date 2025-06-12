// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_resp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterRespDto _$RegisterRespDtoFromJson(Map<String, dynamic> json) =>
    _RegisterRespDto(
      id: (json['id'] as num).toInt(),
      token: json['token'] as String,
    );

Map<String, dynamic> _$RegisterRespDtoToJson(_RegisterRespDto instance) =>
    <String, dynamic>{'id': instance.id, 'token': instance.token};

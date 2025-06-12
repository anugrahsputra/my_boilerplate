// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_resp_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginRespDto {

 String get token;
/// Create a copy of LoginRespDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginRespDtoCopyWith<LoginRespDto> get copyWith => _$LoginRespDtoCopyWithImpl<LoginRespDto>(this as LoginRespDto, _$identity);

  /// Serializes this LoginRespDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginRespDto&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString() {
  return 'LoginRespDto(token: $token)';
}


}

/// @nodoc
abstract mixin class $LoginRespDtoCopyWith<$Res>  {
  factory $LoginRespDtoCopyWith(LoginRespDto value, $Res Function(LoginRespDto) _then) = _$LoginRespDtoCopyWithImpl;
@useResult
$Res call({
 String token
});




}
/// @nodoc
class _$LoginRespDtoCopyWithImpl<$Res>
    implements $LoginRespDtoCopyWith<$Res> {
  _$LoginRespDtoCopyWithImpl(this._self, this._then);

  final LoginRespDto _self;
  final $Res Function(LoginRespDto) _then;

/// Create a copy of LoginRespDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc

@JsonSerializable(explicitToJson: true)
class _LoginRespDto implements LoginRespDto {
  const _LoginRespDto({required this.token});
  factory _LoginRespDto.fromJson(Map<String, dynamic> json) => _$LoginRespDtoFromJson(json);

@override final  String token;

/// Create a copy of LoginRespDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginRespDtoCopyWith<_LoginRespDto> get copyWith => __$LoginRespDtoCopyWithImpl<_LoginRespDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginRespDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginRespDto&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString() {
  return 'LoginRespDto(token: $token)';
}


}

/// @nodoc
abstract mixin class _$LoginRespDtoCopyWith<$Res> implements $LoginRespDtoCopyWith<$Res> {
  factory _$LoginRespDtoCopyWith(_LoginRespDto value, $Res Function(_LoginRespDto) _then) = __$LoginRespDtoCopyWithImpl;
@override @useResult
$Res call({
 String token
});




}
/// @nodoc
class __$LoginRespDtoCopyWithImpl<$Res>
    implements _$LoginRespDtoCopyWith<$Res> {
  __$LoginRespDtoCopyWithImpl(this._self, this._then);

  final _LoginRespDto _self;
  final $Res Function(_LoginRespDto) _then;

/// Create a copy of LoginRespDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,}) {
  return _then(_LoginRespDto(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

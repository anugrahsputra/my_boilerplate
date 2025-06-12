// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_req_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterReqDto {

 String get email; String get password;
/// Create a copy of RegisterReqDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterReqDtoCopyWith<RegisterReqDto> get copyWith => _$RegisterReqDtoCopyWithImpl<RegisterReqDto>(this as RegisterReqDto, _$identity);

  /// Serializes this RegisterReqDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterReqDto&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'RegisterReqDto(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $RegisterReqDtoCopyWith<$Res>  {
  factory $RegisterReqDtoCopyWith(RegisterReqDto value, $Res Function(RegisterReqDto) _then) = _$RegisterReqDtoCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$RegisterReqDtoCopyWithImpl<$Res>
    implements $RegisterReqDtoCopyWith<$Res> {
  _$RegisterReqDtoCopyWithImpl(this._self, this._then);

  final RegisterReqDto _self;
  final $Res Function(RegisterReqDto) _then;

/// Create a copy of RegisterReqDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc

@JsonSerializable(explicitToJson: true)
class _RegisterReqDto implements RegisterReqDto {
  const _RegisterReqDto({required this.email, required this.password});
  factory _RegisterReqDto.fromJson(Map<String, dynamic> json) => _$RegisterReqDtoFromJson(json);

@override final  String email;
@override final  String password;

/// Create a copy of RegisterReqDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterReqDtoCopyWith<_RegisterReqDto> get copyWith => __$RegisterReqDtoCopyWithImpl<_RegisterReqDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterReqDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterReqDto&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'RegisterReqDto(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$RegisterReqDtoCopyWith<$Res> implements $RegisterReqDtoCopyWith<$Res> {
  factory _$RegisterReqDtoCopyWith(_RegisterReqDto value, $Res Function(_RegisterReqDto) _then) = __$RegisterReqDtoCopyWithImpl;
@override @useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$RegisterReqDtoCopyWithImpl<$Res>
    implements _$RegisterReqDtoCopyWith<$Res> {
  __$RegisterReqDtoCopyWithImpl(this._self, this._then);

  final _RegisterReqDto _self;
  final $Res Function(_RegisterReqDto) _then;

/// Create a copy of RegisterReqDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_RegisterReqDto(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

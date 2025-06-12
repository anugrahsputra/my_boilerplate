// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_req_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginReqDto {

 String get email; String get password;
/// Create a copy of LoginReqDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginReqDtoCopyWith<LoginReqDto> get copyWith => _$LoginReqDtoCopyWithImpl<LoginReqDto>(this as LoginReqDto, _$identity);

  /// Serializes this LoginReqDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginReqDto&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'LoginReqDto(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginReqDtoCopyWith<$Res>  {
  factory $LoginReqDtoCopyWith(LoginReqDto value, $Res Function(LoginReqDto) _then) = _$LoginReqDtoCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$LoginReqDtoCopyWithImpl<$Res>
    implements $LoginReqDtoCopyWith<$Res> {
  _$LoginReqDtoCopyWithImpl(this._self, this._then);

  final LoginReqDto _self;
  final $Res Function(LoginReqDto) _then;

/// Create a copy of LoginReqDto
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
class _LoginReqDto implements LoginReqDto {
  const _LoginReqDto({required this.email, required this.password});
  factory _LoginReqDto.fromJson(Map<String, dynamic> json) => _$LoginReqDtoFromJson(json);

@override final  String email;
@override final  String password;

/// Create a copy of LoginReqDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginReqDtoCopyWith<_LoginReqDto> get copyWith => __$LoginReqDtoCopyWithImpl<_LoginReqDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginReqDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginReqDto&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'LoginReqDto(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$LoginReqDtoCopyWith<$Res> implements $LoginReqDtoCopyWith<$Res> {
  factory _$LoginReqDtoCopyWith(_LoginReqDto value, $Res Function(_LoginReqDto) _then) = __$LoginReqDtoCopyWithImpl;
@override @useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$LoginReqDtoCopyWithImpl<$Res>
    implements _$LoginReqDtoCopyWith<$Res> {
  __$LoginReqDtoCopyWithImpl(this._self, this._then);

  final _LoginReqDto _self;
  final $Res Function(_LoginReqDto) _then;

/// Create a copy of LoginReqDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_LoginReqDto(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

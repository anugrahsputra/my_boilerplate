// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_resp_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterRespDto {

 int get id; String get token;
/// Create a copy of RegisterRespDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterRespDtoCopyWith<RegisterRespDto> get copyWith => _$RegisterRespDtoCopyWithImpl<RegisterRespDto>(this as RegisterRespDto, _$identity);

  /// Serializes this RegisterRespDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterRespDto&&(identical(other.id, id) || other.id == id)&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,token);

@override
String toString() {
  return 'RegisterRespDto(id: $id, token: $token)';
}


}

/// @nodoc
abstract mixin class $RegisterRespDtoCopyWith<$Res>  {
  factory $RegisterRespDtoCopyWith(RegisterRespDto value, $Res Function(RegisterRespDto) _then) = _$RegisterRespDtoCopyWithImpl;
@useResult
$Res call({
 int id, String token
});




}
/// @nodoc
class _$RegisterRespDtoCopyWithImpl<$Res>
    implements $RegisterRespDtoCopyWith<$Res> {
  _$RegisterRespDtoCopyWithImpl(this._self, this._then);

  final RegisterRespDto _self;
  final $Res Function(RegisterRespDto) _then;

/// Create a copy of RegisterRespDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? token = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterRespDto].
extension RegisterRespDtoPatterns on RegisterRespDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterRespDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterRespDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterRespDto value)  $default,){
final _that = this;
switch (_that) {
case _RegisterRespDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterRespDto value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterRespDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String token)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterRespDto() when $default != null:
return $default(_that.id,_that.token);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String token)  $default,) {final _that = this;
switch (_that) {
case _RegisterRespDto():
return $default(_that.id,_that.token);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String token)?  $default,) {final _that = this;
switch (_that) {
case _RegisterRespDto() when $default != null:
return $default(_that.id,_that.token);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _RegisterRespDto implements RegisterRespDto {
  const _RegisterRespDto({required this.id, required this.token});
  factory _RegisterRespDto.fromJson(Map<String, dynamic> json) => _$RegisterRespDtoFromJson(json);

@override final  int id;
@override final  String token;

/// Create a copy of RegisterRespDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterRespDtoCopyWith<_RegisterRespDto> get copyWith => __$RegisterRespDtoCopyWithImpl<_RegisterRespDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterRespDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterRespDto&&(identical(other.id, id) || other.id == id)&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,token);

@override
String toString() {
  return 'RegisterRespDto(id: $id, token: $token)';
}


}

/// @nodoc
abstract mixin class _$RegisterRespDtoCopyWith<$Res> implements $RegisterRespDtoCopyWith<$Res> {
  factory _$RegisterRespDtoCopyWith(_RegisterRespDto value, $Res Function(_RegisterRespDto) _then) = __$RegisterRespDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String token
});




}
/// @nodoc
class __$RegisterRespDtoCopyWithImpl<$Res>
    implements _$RegisterRespDtoCopyWith<$Res> {
  __$RegisterRespDtoCopyWithImpl(this._self, this._then);

  final _RegisterRespDto _self;
  final $Res Function(_RegisterRespDto) _then;

/// Create a copy of RegisterRespDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? token = null,}) {
  return _then(_RegisterRespDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

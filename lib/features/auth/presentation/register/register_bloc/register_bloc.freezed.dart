// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent()';
}


}

/// @nodoc
class $RegisterEventCopyWith<$Res>  {
$RegisterEventCopyWith(RegisterEvent _, $Res Function(RegisterEvent) __);
}


/// @nodoc


class RegisterOnEmailChanged implements RegisterEvent {
  const RegisterOnEmailChanged(this.email);
  

 final  String email;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterOnEmailChangedCopyWith<RegisterOnEmailChanged> get copyWith => _$RegisterOnEmailChangedCopyWithImpl<RegisterOnEmailChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterOnEmailChanged&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'RegisterEvent.onEmailChanged(email: $email)';
}


}

/// @nodoc
abstract mixin class $RegisterOnEmailChangedCopyWith<$Res> implements $RegisterEventCopyWith<$Res> {
  factory $RegisterOnEmailChangedCopyWith(RegisterOnEmailChanged value, $Res Function(RegisterOnEmailChanged) _then) = _$RegisterOnEmailChangedCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$RegisterOnEmailChangedCopyWithImpl<$Res>
    implements $RegisterOnEmailChangedCopyWith<$Res> {
  _$RegisterOnEmailChangedCopyWithImpl(this._self, this._then);

  final RegisterOnEmailChanged _self;
  final $Res Function(RegisterOnEmailChanged) _then;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(RegisterOnEmailChanged(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RegisterOnPasswordChanged implements RegisterEvent {
  const RegisterOnPasswordChanged(this.password);
  

 final  String password;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterOnPasswordChangedCopyWith<RegisterOnPasswordChanged> get copyWith => _$RegisterOnPasswordChangedCopyWithImpl<RegisterOnPasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterOnPasswordChanged&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,password);

@override
String toString() {
  return 'RegisterEvent.onPasswordChanged(password: $password)';
}


}

/// @nodoc
abstract mixin class $RegisterOnPasswordChangedCopyWith<$Res> implements $RegisterEventCopyWith<$Res> {
  factory $RegisterOnPasswordChangedCopyWith(RegisterOnPasswordChanged value, $Res Function(RegisterOnPasswordChanged) _then) = _$RegisterOnPasswordChangedCopyWithImpl;
@useResult
$Res call({
 String password
});




}
/// @nodoc
class _$RegisterOnPasswordChangedCopyWithImpl<$Res>
    implements $RegisterOnPasswordChangedCopyWith<$Res> {
  _$RegisterOnPasswordChangedCopyWithImpl(this._self, this._then);

  final RegisterOnPasswordChanged _self;
  final $Res Function(RegisterOnPasswordChanged) _then;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? password = null,}) {
  return _then(RegisterOnPasswordChanged(
null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnRegister implements RegisterEvent {
  const OnRegister();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnRegister);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent.onRegister()';
}


}




/// @nodoc
mixin _$RegisterState {

 String get email; String get password; bool get isLoading; bool get isSuccess; String? get errorMessage;
/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterStateCopyWith<RegisterState> get copyWith => _$RegisterStateCopyWithImpl<RegisterState>(this as RegisterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,isLoading,isSuccess,errorMessage);

@override
String toString() {
  return 'RegisterState(email: $email, password: $password, isLoading: $isLoading, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $RegisterStateCopyWith<$Res>  {
  factory $RegisterStateCopyWith(RegisterState value, $Res Function(RegisterState) _then) = _$RegisterStateCopyWithImpl;
@useResult
$Res call({
 String email, String password, bool isLoading, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._self, this._then);

  final RegisterState _self;
  final $Res Function(RegisterState) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? isLoading = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _RegisterState implements RegisterState {
  const _RegisterState({required this.email, required this.password, required this.isLoading, required this.isSuccess, this.errorMessage});
  

@override final  String email;
@override final  String password;
@override final  bool isLoading;
@override final  bool isSuccess;
@override final  String? errorMessage;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterStateCopyWith<_RegisterState> get copyWith => __$RegisterStateCopyWithImpl<_RegisterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,isLoading,isSuccess,errorMessage);

@override
String toString() {
  return 'RegisterState(email: $email, password: $password, isLoading: $isLoading, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$RegisterStateCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterStateCopyWith(_RegisterState value, $Res Function(_RegisterState) _then) = __$RegisterStateCopyWithImpl;
@override @useResult
$Res call({
 String email, String password, bool isLoading, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class __$RegisterStateCopyWithImpl<$Res>
    implements _$RegisterStateCopyWith<$Res> {
  __$RegisterStateCopyWithImpl(this._self, this._then);

  final _RegisterState _self;
  final $Res Function(_RegisterState) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? isLoading = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_RegisterState(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

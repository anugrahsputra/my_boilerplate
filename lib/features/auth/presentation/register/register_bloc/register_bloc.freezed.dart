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

 String get email; String get password;
/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterEventCopyWith<RegisterEvent> get copyWith => _$RegisterEventCopyWithImpl<RegisterEvent>(this as RegisterEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterEvent&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'RegisterEvent(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $RegisterEventCopyWith<$Res>  {
  factory $RegisterEventCopyWith(RegisterEvent value, $Res Function(RegisterEvent) _then) = _$RegisterEventCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$RegisterEventCopyWithImpl<$Res>
    implements $RegisterEventCopyWith<$Res> {
  _$RegisterEventCopyWithImpl(this._self, this._then);

  final RegisterEvent _self;
  final $Res Function(RegisterEvent) _then;

/// Create a copy of RegisterEvent
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


class OnRegister implements RegisterEvent {
  const OnRegister(this.email, this.password);
  

@override final  String email;
@override final  String password;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnRegisterCopyWith<OnRegister> get copyWith => _$OnRegisterCopyWithImpl<OnRegister>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnRegister&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'RegisterEvent.onRegister(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $OnRegisterCopyWith<$Res> implements $RegisterEventCopyWith<$Res> {
  factory $OnRegisterCopyWith(OnRegister value, $Res Function(OnRegister) _then) = _$OnRegisterCopyWithImpl;
@override @useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$OnRegisterCopyWithImpl<$Res>
    implements $OnRegisterCopyWith<$Res> {
  _$OnRegisterCopyWithImpl(this._self, this._then);

  final OnRegister _self;
  final $Res Function(OnRegister) _then;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(OnRegister(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$RegisterState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterState()';
}


}

/// @nodoc
class $RegisterStateCopyWith<$Res>  {
$RegisterStateCopyWith(RegisterState _, $Res Function(RegisterState) __);
}


/// @nodoc


class RegisterInitial implements RegisterState {
  const RegisterInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterState.initial()';
}


}




/// @nodoc


class RegisterLoading implements RegisterState {
  const RegisterLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterState.loading()';
}


}




/// @nodoc


class RegisterSuccess implements RegisterState {
  const RegisterSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterState.success()';
}


}




/// @nodoc


class RegisterFailed implements RegisterState {
  const RegisterFailed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterState.failed()';
}


}




// dart format on

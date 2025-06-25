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


class RegisterOnNameChanged implements RegisterEvent {
  const RegisterOnNameChanged(this.name);
  

 final  String name;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterOnNameChangedCopyWith<RegisterOnNameChanged> get copyWith => _$RegisterOnNameChangedCopyWithImpl<RegisterOnNameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterOnNameChanged&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'RegisterEvent.onNameChanged(name: $name)';
}


}

/// @nodoc
abstract mixin class $RegisterOnNameChangedCopyWith<$Res> implements $RegisterEventCopyWith<$Res> {
  factory $RegisterOnNameChangedCopyWith(RegisterOnNameChanged value, $Res Function(RegisterOnNameChanged) _then) = _$RegisterOnNameChangedCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$RegisterOnNameChangedCopyWithImpl<$Res>
    implements $RegisterOnNameChangedCopyWith<$Res> {
  _$RegisterOnNameChangedCopyWithImpl(this._self, this._then);

  final RegisterOnNameChanged _self;
  final $Res Function(RegisterOnNameChanged) _then;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(RegisterOnNameChanged(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RegisterOnPhoneChanged implements RegisterEvent {
  const RegisterOnPhoneChanged(this.phoneNumber);
  

 final  String phoneNumber;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterOnPhoneChangedCopyWith<RegisterOnPhoneChanged> get copyWith => _$RegisterOnPhoneChangedCopyWithImpl<RegisterOnPhoneChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterOnPhoneChanged&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}


@override
int get hashCode => Object.hash(runtimeType,phoneNumber);

@override
String toString() {
  return 'RegisterEvent.onPhoneChanged(phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class $RegisterOnPhoneChangedCopyWith<$Res> implements $RegisterEventCopyWith<$Res> {
  factory $RegisterOnPhoneChangedCopyWith(RegisterOnPhoneChanged value, $Res Function(RegisterOnPhoneChanged) _then) = _$RegisterOnPhoneChangedCopyWithImpl;
@useResult
$Res call({
 String phoneNumber
});




}
/// @nodoc
class _$RegisterOnPhoneChangedCopyWithImpl<$Res>
    implements $RegisterOnPhoneChangedCopyWith<$Res> {
  _$RegisterOnPhoneChangedCopyWithImpl(this._self, this._then);

  final RegisterOnPhoneChanged _self;
  final $Res Function(RegisterOnPhoneChanged) _then;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,}) {
  return _then(RegisterOnPhoneChanged(
null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


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


class RegisterOnError implements RegisterEvent {
  const RegisterOnError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterOnError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent.onError()';
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

 Name get name; PhoneNumber get phoneNumber; Email get email; Password get password; FormzSubmissionStatus get status; bool get isValid; bool get hasSubmitted; String? get errorMessage;
/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterStateCopyWith<RegisterState> get copyWith => _$RegisterStateCopyWithImpl<RegisterState>(this as RegisterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterState&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.status, status) || other.status == status)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.hasSubmitted, hasSubmitted) || other.hasSubmitted == hasSubmitted)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,name,phoneNumber,email,password,status,isValid,hasSubmitted,errorMessage);

@override
String toString() {
  return 'RegisterState(name: $name, phoneNumber: $phoneNumber, email: $email, password: $password, status: $status, isValid: $isValid, hasSubmitted: $hasSubmitted, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $RegisterStateCopyWith<$Res>  {
  factory $RegisterStateCopyWith(RegisterState value, $Res Function(RegisterState) _then) = _$RegisterStateCopyWithImpl;
@useResult
$Res call({
 Name name, PhoneNumber phoneNumber, Email email, Password password, FormzSubmissionStatus status, bool isValid, bool hasSubmitted, String? errorMessage
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
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? phoneNumber = null,Object? email = null,Object? password = null,Object? status = null,Object? isValid = null,Object? hasSubmitted = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Name,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as PhoneNumber,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as Email,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as Password,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,hasSubmitted: null == hasSubmitted ? _self.hasSubmitted : hasSubmitted // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _RegisterState implements RegisterState {
  const _RegisterState({this.name = const Name.pure(), this.phoneNumber = const PhoneNumber.pure(), this.email = const Email.pure(), this.password = const Password.pure(), this.status = FormzSubmissionStatus.initial, this.isValid = false, this.hasSubmitted = false, this.errorMessage});
  

@override@JsonKey() final  Name name;
@override@JsonKey() final  PhoneNumber phoneNumber;
@override@JsonKey() final  Email email;
@override@JsonKey() final  Password password;
@override@JsonKey() final  FormzSubmissionStatus status;
@override@JsonKey() final  bool isValid;
@override@JsonKey() final  bool hasSubmitted;
@override final  String? errorMessage;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterStateCopyWith<_RegisterState> get copyWith => __$RegisterStateCopyWithImpl<_RegisterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterState&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.status, status) || other.status == status)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.hasSubmitted, hasSubmitted) || other.hasSubmitted == hasSubmitted)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,name,phoneNumber,email,password,status,isValid,hasSubmitted,errorMessage);

@override
String toString() {
  return 'RegisterState(name: $name, phoneNumber: $phoneNumber, email: $email, password: $password, status: $status, isValid: $isValid, hasSubmitted: $hasSubmitted, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$RegisterStateCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterStateCopyWith(_RegisterState value, $Res Function(_RegisterState) _then) = __$RegisterStateCopyWithImpl;
@override @useResult
$Res call({
 Name name, PhoneNumber phoneNumber, Email email, Password password, FormzSubmissionStatus status, bool isValid, bool hasSubmitted, String? errorMessage
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
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? phoneNumber = null,Object? email = null,Object? password = null,Object? status = null,Object? isValid = null,Object? hasSubmitted = null,Object? errorMessage = freezed,}) {
  return _then(_RegisterState(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Name,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as PhoneNumber,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as Email,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as Password,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,hasSubmitted: null == hasSubmitted ? _self.hasSubmitted : hasSubmitted // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

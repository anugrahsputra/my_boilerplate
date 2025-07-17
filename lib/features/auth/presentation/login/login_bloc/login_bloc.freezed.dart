// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent()';
}


}

/// @nodoc
class $LoginEventCopyWith<$Res>  {
$LoginEventCopyWith(LoginEvent _, $Res Function(LoginEvent) __);
}


/// Adds pattern-matching-related methods to [LoginEvent].
extension LoginEventPatterns on LoginEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoginOnEmailChanged value)?  onEmailChanged,TResult Function( LoginOnPasswordChanged value)?  onPasswordChanged,TResult Function( LoginOnError value)?  onError,TResult Function( OnLogin value)?  onLogin,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoginOnEmailChanged() when onEmailChanged != null:
return onEmailChanged(_that);case LoginOnPasswordChanged() when onPasswordChanged != null:
return onPasswordChanged(_that);case LoginOnError() when onError != null:
return onError(_that);case OnLogin() when onLogin != null:
return onLogin(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoginOnEmailChanged value)  onEmailChanged,required TResult Function( LoginOnPasswordChanged value)  onPasswordChanged,required TResult Function( LoginOnError value)  onError,required TResult Function( OnLogin value)  onLogin,}){
final _that = this;
switch (_that) {
case LoginOnEmailChanged():
return onEmailChanged(_that);case LoginOnPasswordChanged():
return onPasswordChanged(_that);case LoginOnError():
return onError(_that);case OnLogin():
return onLogin(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoginOnEmailChanged value)?  onEmailChanged,TResult? Function( LoginOnPasswordChanged value)?  onPasswordChanged,TResult? Function( LoginOnError value)?  onError,TResult? Function( OnLogin value)?  onLogin,}){
final _that = this;
switch (_that) {
case LoginOnEmailChanged() when onEmailChanged != null:
return onEmailChanged(_that);case LoginOnPasswordChanged() when onPasswordChanged != null:
return onPasswordChanged(_that);case LoginOnError() when onError != null:
return onError(_that);case OnLogin() when onLogin != null:
return onLogin(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email)?  onEmailChanged,TResult Function( String password)?  onPasswordChanged,TResult Function()?  onError,TResult Function()?  onLogin,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoginOnEmailChanged() when onEmailChanged != null:
return onEmailChanged(_that.email);case LoginOnPasswordChanged() when onPasswordChanged != null:
return onPasswordChanged(_that.password);case LoginOnError() when onError != null:
return onError();case OnLogin() when onLogin != null:
return onLogin();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email)  onEmailChanged,required TResult Function( String password)  onPasswordChanged,required TResult Function()  onError,required TResult Function()  onLogin,}) {final _that = this;
switch (_that) {
case LoginOnEmailChanged():
return onEmailChanged(_that.email);case LoginOnPasswordChanged():
return onPasswordChanged(_that.password);case LoginOnError():
return onError();case OnLogin():
return onLogin();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email)?  onEmailChanged,TResult? Function( String password)?  onPasswordChanged,TResult? Function()?  onError,TResult? Function()?  onLogin,}) {final _that = this;
switch (_that) {
case LoginOnEmailChanged() when onEmailChanged != null:
return onEmailChanged(_that.email);case LoginOnPasswordChanged() when onPasswordChanged != null:
return onPasswordChanged(_that.password);case LoginOnError() when onError != null:
return onError();case OnLogin() when onLogin != null:
return onLogin();case _:
  return null;

}
}

}

/// @nodoc


class LoginOnEmailChanged implements LoginEvent {
  const LoginOnEmailChanged(this.email);
  

 final  String email;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginOnEmailChangedCopyWith<LoginOnEmailChanged> get copyWith => _$LoginOnEmailChangedCopyWithImpl<LoginOnEmailChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginOnEmailChanged&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'LoginEvent.onEmailChanged(email: $email)';
}


}

/// @nodoc
abstract mixin class $LoginOnEmailChangedCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory $LoginOnEmailChangedCopyWith(LoginOnEmailChanged value, $Res Function(LoginOnEmailChanged) _then) = _$LoginOnEmailChangedCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$LoginOnEmailChangedCopyWithImpl<$Res>
    implements $LoginOnEmailChangedCopyWith<$Res> {
  _$LoginOnEmailChangedCopyWithImpl(this._self, this._then);

  final LoginOnEmailChanged _self;
  final $Res Function(LoginOnEmailChanged) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(LoginOnEmailChanged(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoginOnPasswordChanged implements LoginEvent {
  const LoginOnPasswordChanged(this.password);
  

 final  String password;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginOnPasswordChangedCopyWith<LoginOnPasswordChanged> get copyWith => _$LoginOnPasswordChangedCopyWithImpl<LoginOnPasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginOnPasswordChanged&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,password);

@override
String toString() {
  return 'LoginEvent.onPasswordChanged(password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginOnPasswordChangedCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory $LoginOnPasswordChangedCopyWith(LoginOnPasswordChanged value, $Res Function(LoginOnPasswordChanged) _then) = _$LoginOnPasswordChangedCopyWithImpl;
@useResult
$Res call({
 String password
});




}
/// @nodoc
class _$LoginOnPasswordChangedCopyWithImpl<$Res>
    implements $LoginOnPasswordChangedCopyWith<$Res> {
  _$LoginOnPasswordChangedCopyWithImpl(this._self, this._then);

  final LoginOnPasswordChanged _self;
  final $Res Function(LoginOnPasswordChanged) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? password = null,}) {
  return _then(LoginOnPasswordChanged(
null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoginOnError implements LoginEvent {
  const LoginOnError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginOnError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.onError()';
}


}




/// @nodoc


class OnLogin implements LoginEvent {
  const OnLogin();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnLogin);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.onLogin()';
}


}




/// @nodoc
mixin _$LoginState {

 Email get email; Password get password; FormzSubmissionStatus get status; bool get isValid; bool get hasSubmitted; String? get errorMessage;
/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateCopyWith<LoginState> get copyWith => _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.status, status) || other.status == status)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.hasSubmitted, hasSubmitted) || other.hasSubmitted == hasSubmitted)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,status,isValid,hasSubmitted,errorMessage);

@override
String toString() {
  return 'LoginState(email: $email, password: $password, status: $status, isValid: $isValid, hasSubmitted: $hasSubmitted, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res>  {
  factory $LoginStateCopyWith(LoginState value, $Res Function(LoginState) _then) = _$LoginStateCopyWithImpl;
@useResult
$Res call({
 Email email, Password password, FormzSubmissionStatus status, bool isValid, bool hasSubmitted, String? errorMessage
});




}
/// @nodoc
class _$LoginStateCopyWithImpl<$Res>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? status = null,Object? isValid = null,Object? hasSubmitted = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as Email,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as Password,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,hasSubmitted: null == hasSubmitted ? _self.hasSubmitted : hasSubmitted // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginState value)  $default,){
final _that = this;
switch (_that) {
case _LoginState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginState value)?  $default,){
final _that = this;
switch (_that) {
case _LoginState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Email email,  Password password,  FormzSubmissionStatus status,  bool isValid,  bool hasSubmitted,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that.email,_that.password,_that.status,_that.isValid,_that.hasSubmitted,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Email email,  Password password,  FormzSubmissionStatus status,  bool isValid,  bool hasSubmitted,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _LoginState():
return $default(_that.email,_that.password,_that.status,_that.isValid,_that.hasSubmitted,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Email email,  Password password,  FormzSubmissionStatus status,  bool isValid,  bool hasSubmitted,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that.email,_that.password,_that.status,_that.isValid,_that.hasSubmitted,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _LoginState implements LoginState {
  const _LoginState({this.email = const Email.pure(), this.password = const Password.pure(), this.status = FormzSubmissionStatus.initial, this.isValid = false, this.hasSubmitted = false, this.errorMessage});
  

@override@JsonKey() final  Email email;
@override@JsonKey() final  Password password;
@override@JsonKey() final  FormzSubmissionStatus status;
@override@JsonKey() final  bool isValid;
@override@JsonKey() final  bool hasSubmitted;
@override final  String? errorMessage;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginStateCopyWith<_LoginState> get copyWith => __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.status, status) || other.status == status)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.hasSubmitted, hasSubmitted) || other.hasSubmitted == hasSubmitted)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,status,isValid,hasSubmitted,errorMessage);

@override
String toString() {
  return 'LoginState(email: $email, password: $password, status: $status, isValid: $isValid, hasSubmitted: $hasSubmitted, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(_LoginState value, $Res Function(_LoginState) _then) = __$LoginStateCopyWithImpl;
@override @useResult
$Res call({
 Email email, Password password, FormzSubmissionStatus status, bool isValid, bool hasSubmitted, String? errorMessage
});




}
/// @nodoc
class __$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(this._self, this._then);

  final _LoginState _self;
  final $Res Function(_LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? status = null,Object? isValid = null,Object? hasSubmitted = null,Object? errorMessage = freezed,}) {
  return _then(_LoginState(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
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

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {

 String get message;
/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this as Failure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res>  {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FailureCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Failure value)?  failure,TResult Function( ServerFailure value)?  serverFailure,TResult Function( UnauthorizedFailure value)?  unauthorizeFailure,TResult Function( CacheFailure value)?  cacheFailure,TResult Function( NetworkFailure value)?  networkFailure,TResult Function( ForbiddenFailure value)?  forbidden,TResult Function( RequestFailure value)?  requestFailure,TResult Function( DatabaseFailure value)?  databaseFailre,TResult Function( AuthFailure value)?  authFailure,TResult Function( CertificateFailure value)?  certificateFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Failure() when failure != null:
return failure(_that);case ServerFailure() when serverFailure != null:
return serverFailure(_that);case UnauthorizedFailure() when unauthorizeFailure != null:
return unauthorizeFailure(_that);case CacheFailure() when cacheFailure != null:
return cacheFailure(_that);case NetworkFailure() when networkFailure != null:
return networkFailure(_that);case ForbiddenFailure() when forbidden != null:
return forbidden(_that);case RequestFailure() when requestFailure != null:
return requestFailure(_that);case DatabaseFailure() when databaseFailre != null:
return databaseFailre(_that);case AuthFailure() when authFailure != null:
return authFailure(_that);case CertificateFailure() when certificateFailure != null:
return certificateFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Failure value)  failure,required TResult Function( ServerFailure value)  serverFailure,required TResult Function( UnauthorizedFailure value)  unauthorizeFailure,required TResult Function( CacheFailure value)  cacheFailure,required TResult Function( NetworkFailure value)  networkFailure,required TResult Function( ForbiddenFailure value)  forbidden,required TResult Function( RequestFailure value)  requestFailure,required TResult Function( DatabaseFailure value)  databaseFailre,required TResult Function( AuthFailure value)  authFailure,required TResult Function( CertificateFailure value)  certificateFailure,}){
final _that = this;
switch (_that) {
case _Failure():
return failure(_that);case ServerFailure():
return serverFailure(_that);case UnauthorizedFailure():
return unauthorizeFailure(_that);case CacheFailure():
return cacheFailure(_that);case NetworkFailure():
return networkFailure(_that);case ForbiddenFailure():
return forbidden(_that);case RequestFailure():
return requestFailure(_that);case DatabaseFailure():
return databaseFailre(_that);case AuthFailure():
return authFailure(_that);case CertificateFailure():
return certificateFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Failure value)?  failure,TResult? Function( ServerFailure value)?  serverFailure,TResult? Function( UnauthorizedFailure value)?  unauthorizeFailure,TResult? Function( CacheFailure value)?  cacheFailure,TResult? Function( NetworkFailure value)?  networkFailure,TResult? Function( ForbiddenFailure value)?  forbidden,TResult? Function( RequestFailure value)?  requestFailure,TResult? Function( DatabaseFailure value)?  databaseFailre,TResult? Function( AuthFailure value)?  authFailure,TResult? Function( CertificateFailure value)?  certificateFailure,}){
final _that = this;
switch (_that) {
case _Failure() when failure != null:
return failure(_that);case ServerFailure() when serverFailure != null:
return serverFailure(_that);case UnauthorizedFailure() when unauthorizeFailure != null:
return unauthorizeFailure(_that);case CacheFailure() when cacheFailure != null:
return cacheFailure(_that);case NetworkFailure() when networkFailure != null:
return networkFailure(_that);case ForbiddenFailure() when forbidden != null:
return forbidden(_that);case RequestFailure() when requestFailure != null:
return requestFailure(_that);case DatabaseFailure() when databaseFailre != null:
return databaseFailre(_that);case AuthFailure() when authFailure != null:
return authFailure(_that);case CertificateFailure() when certificateFailure != null:
return certificateFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  failure,TResult Function( String message)?  serverFailure,TResult Function( String message)?  unauthorizeFailure,TResult Function( String message)?  cacheFailure,TResult Function( String message)?  networkFailure,TResult Function( String message)?  forbidden,TResult Function( String message)?  requestFailure,TResult Function( String message)?  databaseFailre,TResult Function( String message)?  authFailure,TResult Function( String message)?  certificateFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Failure() when failure != null:
return failure(_that.message);case ServerFailure() when serverFailure != null:
return serverFailure(_that.message);case UnauthorizedFailure() when unauthorizeFailure != null:
return unauthorizeFailure(_that.message);case CacheFailure() when cacheFailure != null:
return cacheFailure(_that.message);case NetworkFailure() when networkFailure != null:
return networkFailure(_that.message);case ForbiddenFailure() when forbidden != null:
return forbidden(_that.message);case RequestFailure() when requestFailure != null:
return requestFailure(_that.message);case DatabaseFailure() when databaseFailre != null:
return databaseFailre(_that.message);case AuthFailure() when authFailure != null:
return authFailure(_that.message);case CertificateFailure() when certificateFailure != null:
return certificateFailure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  failure,required TResult Function( String message)  serverFailure,required TResult Function( String message)  unauthorizeFailure,required TResult Function( String message)  cacheFailure,required TResult Function( String message)  networkFailure,required TResult Function( String message)  forbidden,required TResult Function( String message)  requestFailure,required TResult Function( String message)  databaseFailre,required TResult Function( String message)  authFailure,required TResult Function( String message)  certificateFailure,}) {final _that = this;
switch (_that) {
case _Failure():
return failure(_that.message);case ServerFailure():
return serverFailure(_that.message);case UnauthorizedFailure():
return unauthorizeFailure(_that.message);case CacheFailure():
return cacheFailure(_that.message);case NetworkFailure():
return networkFailure(_that.message);case ForbiddenFailure():
return forbidden(_that.message);case RequestFailure():
return requestFailure(_that.message);case DatabaseFailure():
return databaseFailre(_that.message);case AuthFailure():
return authFailure(_that.message);case CertificateFailure():
return certificateFailure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  failure,TResult? Function( String message)?  serverFailure,TResult? Function( String message)?  unauthorizeFailure,TResult? Function( String message)?  cacheFailure,TResult? Function( String message)?  networkFailure,TResult? Function( String message)?  forbidden,TResult? Function( String message)?  requestFailure,TResult? Function( String message)?  databaseFailre,TResult? Function( String message)?  authFailure,TResult? Function( String message)?  certificateFailure,}) {final _that = this;
switch (_that) {
case _Failure() when failure != null:
return failure(_that.message);case ServerFailure() when serverFailure != null:
return serverFailure(_that.message);case UnauthorizedFailure() when unauthorizeFailure != null:
return unauthorizeFailure(_that.message);case CacheFailure() when cacheFailure != null:
return cacheFailure(_that.message);case NetworkFailure() when networkFailure != null:
return networkFailure(_that.message);case ForbiddenFailure() when forbidden != null:
return forbidden(_that.message);case RequestFailure() when requestFailure != null:
return requestFailure(_that.message);case DatabaseFailure() when databaseFailre != null:
return databaseFailre(_that.message);case AuthFailure() when authFailure != null:
return authFailure(_that.message);case CertificateFailure() when certificateFailure != null:
return certificateFailure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Failure implements Failure {
  const _Failure({required this.message});
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ServerFailure implements Failure {
  const ServerFailure({required this.message});
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerFailureCopyWith<ServerFailure> get copyWith => _$ServerFailureCopyWithImpl<ServerFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.serverFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ServerFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ServerFailureCopyWith(ServerFailure value, $Res Function(ServerFailure) _then) = _$ServerFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ServerFailureCopyWithImpl<$Res>
    implements $ServerFailureCopyWith<$Res> {
  _$ServerFailureCopyWithImpl(this._self, this._then);

  final ServerFailure _self;
  final $Res Function(ServerFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ServerFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UnauthorizedFailure implements Failure {
  const UnauthorizedFailure({required this.message});
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnauthorizedFailureCopyWith<UnauthorizedFailure> get copyWith => _$UnauthorizedFailureCopyWithImpl<UnauthorizedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnauthorizedFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.unauthorizeFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $UnauthorizedFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $UnauthorizedFailureCopyWith(UnauthorizedFailure value, $Res Function(UnauthorizedFailure) _then) = _$UnauthorizedFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UnauthorizedFailureCopyWithImpl<$Res>
    implements $UnauthorizedFailureCopyWith<$Res> {
  _$UnauthorizedFailureCopyWithImpl(this._self, this._then);

  final UnauthorizedFailure _self;
  final $Res Function(UnauthorizedFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UnauthorizedFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CacheFailure implements Failure {
  const CacheFailure({required this.message});
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CacheFailureCopyWith<CacheFailure> get copyWith => _$CacheFailureCopyWithImpl<CacheFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CacheFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.cacheFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $CacheFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $CacheFailureCopyWith(CacheFailure value, $Res Function(CacheFailure) _then) = _$CacheFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CacheFailureCopyWithImpl<$Res>
    implements $CacheFailureCopyWith<$Res> {
  _$CacheFailureCopyWithImpl(this._self, this._then);

  final CacheFailure _self;
  final $Res Function(CacheFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CacheFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NetworkFailure implements Failure {
  const NetworkFailure({required this.message});
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkFailureCopyWith<NetworkFailure> get copyWith => _$NetworkFailureCopyWithImpl<NetworkFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.networkFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $NetworkFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $NetworkFailureCopyWith(NetworkFailure value, $Res Function(NetworkFailure) _then) = _$NetworkFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NetworkFailureCopyWithImpl<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  _$NetworkFailureCopyWithImpl(this._self, this._then);

  final NetworkFailure _self;
  final $Res Function(NetworkFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NetworkFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ForbiddenFailure implements Failure {
  const ForbiddenFailure({required this.message});
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForbiddenFailureCopyWith<ForbiddenFailure> get copyWith => _$ForbiddenFailureCopyWithImpl<ForbiddenFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForbiddenFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.forbidden(message: $message)';
}


}

/// @nodoc
abstract mixin class $ForbiddenFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ForbiddenFailureCopyWith(ForbiddenFailure value, $Res Function(ForbiddenFailure) _then) = _$ForbiddenFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ForbiddenFailureCopyWithImpl<$Res>
    implements $ForbiddenFailureCopyWith<$Res> {
  _$ForbiddenFailureCopyWithImpl(this._self, this._then);

  final ForbiddenFailure _self;
  final $Res Function(ForbiddenFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ForbiddenFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RequestFailure implements Failure {
  const RequestFailure({required this.message});
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestFailureCopyWith<RequestFailure> get copyWith => _$RequestFailureCopyWithImpl<RequestFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.requestFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $RequestFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $RequestFailureCopyWith(RequestFailure value, $Res Function(RequestFailure) _then) = _$RequestFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$RequestFailureCopyWithImpl<$Res>
    implements $RequestFailureCopyWith<$Res> {
  _$RequestFailureCopyWithImpl(this._self, this._then);

  final RequestFailure _self;
  final $Res Function(RequestFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(RequestFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DatabaseFailure implements Failure {
  const DatabaseFailure({required this.message});
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DatabaseFailureCopyWith<DatabaseFailure> get copyWith => _$DatabaseFailureCopyWithImpl<DatabaseFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DatabaseFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.databaseFailre(message: $message)';
}


}

/// @nodoc
abstract mixin class $DatabaseFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $DatabaseFailureCopyWith(DatabaseFailure value, $Res Function(DatabaseFailure) _then) = _$DatabaseFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DatabaseFailureCopyWithImpl<$Res>
    implements $DatabaseFailureCopyWith<$Res> {
  _$DatabaseFailureCopyWithImpl(this._self, this._then);

  final DatabaseFailure _self;
  final $Res Function(DatabaseFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DatabaseFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthFailure implements Failure {
  const AuthFailure({required this.message});
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFailureCopyWith<AuthFailure> get copyWith => _$AuthFailureCopyWithImpl<AuthFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.authFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(AuthFailure value, $Res Function(AuthFailure) _then) = _$AuthFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuthFailureCopyWithImpl<$Res>
    implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._self, this._then);

  final AuthFailure _self;
  final $Res Function(AuthFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AuthFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CertificateFailure implements Failure {
  const CertificateFailure({required this.message});
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CertificateFailureCopyWith<CertificateFailure> get copyWith => _$CertificateFailureCopyWithImpl<CertificateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CertificateFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.certificateFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $CertificateFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $CertificateFailureCopyWith(CertificateFailure value, $Res Function(CertificateFailure) _then) = _$CertificateFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CertificateFailureCopyWithImpl<$Res>
    implements $CertificateFailureCopyWith<$Res> {
  _$CertificateFailureCopyWithImpl(this._self, this._then);

  final CertificateFailure _self;
  final $Res Function(CertificateFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CertificateFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

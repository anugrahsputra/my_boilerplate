// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppState()';
}


}

/// @nodoc
class $AppStateCopyWith<$Res>  {
$AppStateCopyWith(AppState _, $Res Function(AppState) __);
}


/// Adds pattern-matching-related methods to [AppState].
extension AppStatePatterns on AppState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AppInitial value)?  initial,TResult Function( AppLoading value)?  loading,TResult Function( AppAuthenticated value)?  authenticated,TResult Function( AppUnauthenticated value)?  unauthenticated,TResult Function( AppError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AppInitial() when initial != null:
return initial(_that);case AppLoading() when loading != null:
return loading(_that);case AppAuthenticated() when authenticated != null:
return authenticated(_that);case AppUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case AppError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AppInitial value)  initial,required TResult Function( AppLoading value)  loading,required TResult Function( AppAuthenticated value)  authenticated,required TResult Function( AppUnauthenticated value)  unauthenticated,required TResult Function( AppError value)  error,}){
final _that = this;
switch (_that) {
case AppInitial():
return initial(_that);case AppLoading():
return loading(_that);case AppAuthenticated():
return authenticated(_that);case AppUnauthenticated():
return unauthenticated(_that);case AppError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AppInitial value)?  initial,TResult? Function( AppLoading value)?  loading,TResult? Function( AppAuthenticated value)?  authenticated,TResult? Function( AppUnauthenticated value)?  unauthenticated,TResult? Function( AppError value)?  error,}){
final _that = this;
switch (_that) {
case AppInitial() when initial != null:
return initial(_that);case AppLoading() when loading != null:
return loading(_that);case AppAuthenticated() when authenticated != null:
return authenticated(_that);case AppUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case AppError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  authenticated,TResult Function()?  unauthenticated,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AppInitial() when initial != null:
return initial();case AppLoading() when loading != null:
return loading();case AppAuthenticated() when authenticated != null:
return authenticated();case AppUnauthenticated() when unauthenticated != null:
return unauthenticated();case AppError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  authenticated,required TResult Function()  unauthenticated,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case AppInitial():
return initial();case AppLoading():
return loading();case AppAuthenticated():
return authenticated();case AppUnauthenticated():
return unauthenticated();case AppError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  authenticated,TResult? Function()?  unauthenticated,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case AppInitial() when initial != null:
return initial();case AppLoading() when loading != null:
return loading();case AppAuthenticated() when authenticated != null:
return authenticated();case AppUnauthenticated() when unauthenticated != null:
return unauthenticated();case AppError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AppInitial implements AppState {
  const AppInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppState.initial()';
}


}




/// @nodoc


class AppLoading implements AppState {
  const AppLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppState.loading()';
}


}




/// @nodoc


class AppAuthenticated implements AppState {
  const AppAuthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppAuthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppState.authenticated()';
}


}




/// @nodoc


class AppUnauthenticated implements AppState {
  const AppUnauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUnauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppState.unauthenticated()';
}


}




/// @nodoc


class AppError implements AppState {
  const AppError(this.message);
  

 final  String message;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppErrorCopyWith<AppError> get copyWith => _$AppErrorCopyWithImpl<AppError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AppErrorCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory $AppErrorCopyWith(AppError value, $Res Function(AppError) _then) = _$AppErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AppErrorCopyWithImpl<$Res>
    implements $AppErrorCopyWith<$Res> {
  _$AppErrorCopyWithImpl(this._self, this._then);

  final AppError _self;
  final $Res Function(AppError) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AppError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

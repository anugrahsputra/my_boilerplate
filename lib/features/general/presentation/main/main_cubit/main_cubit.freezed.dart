// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MainState {

 MainTab get currentTab; Map<MainTab, Widget> get pages; Map<MainTab, int> get badges; bool get isLoading;
/// Create a copy of MainState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainStateCopyWith<MainState> get copyWith => _$MainStateCopyWithImpl<MainState>(this as MainState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainState&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab)&&const DeepCollectionEquality().equals(other.pages, pages)&&const DeepCollectionEquality().equals(other.badges, badges)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,currentTab,const DeepCollectionEquality().hash(pages),const DeepCollectionEquality().hash(badges),isLoading);

@override
String toString() {
  return 'MainState(currentTab: $currentTab, pages: $pages, badges: $badges, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $MainStateCopyWith<$Res>  {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) _then) = _$MainStateCopyWithImpl;
@useResult
$Res call({
 MainTab currentTab, Map<MainTab, Widget> pages, Map<MainTab, int> badges, bool isLoading
});


$MainTabCopyWith<$Res> get currentTab;

}
/// @nodoc
class _$MainStateCopyWithImpl<$Res>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._self, this._then);

  final MainState _self;
  final $Res Function(MainState) _then;

/// Create a copy of MainState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentTab = null,Object? pages = null,Object? badges = null,Object? isLoading = null,}) {
  return _then(_self.copyWith(
currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as MainTab,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as Map<MainTab, Widget>,badges: null == badges ? _self.badges : badges // ignore: cast_nullable_to_non_nullable
as Map<MainTab, int>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MainState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MainTabCopyWith<$Res> get currentTab {
  
  return $MainTabCopyWith<$Res>(_self.currentTab, (value) {
    return _then(_self.copyWith(currentTab: value));
  });
}
}


/// Adds pattern-matching-related methods to [MainState].
extension MainStatePatterns on MainState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MainState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MainState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MainState value)  $default,){
final _that = this;
switch (_that) {
case _MainState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MainState value)?  $default,){
final _that = this;
switch (_that) {
case _MainState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MainTab currentTab,  Map<MainTab, Widget> pages,  Map<MainTab, int> badges,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MainState() when $default != null:
return $default(_that.currentTab,_that.pages,_that.badges,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MainTab currentTab,  Map<MainTab, Widget> pages,  Map<MainTab, int> badges,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _MainState():
return $default(_that.currentTab,_that.pages,_that.badges,_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MainTab currentTab,  Map<MainTab, Widget> pages,  Map<MainTab, int> badges,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _MainState() when $default != null:
return $default(_that.currentTab,_that.pages,_that.badges,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _MainState extends MainState {
  const _MainState({this.currentTab = const MainTab.home(), final  Map<MainTab, Widget> pages = const {}, final  Map<MainTab, int> badges = const {}, this.isLoading = false}): _pages = pages,_badges = badges,super._();
  

@override@JsonKey() final  MainTab currentTab;
 final  Map<MainTab, Widget> _pages;
@override@JsonKey() Map<MainTab, Widget> get pages {
  if (_pages is EqualUnmodifiableMapView) return _pages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_pages);
}

 final  Map<MainTab, int> _badges;
@override@JsonKey() Map<MainTab, int> get badges {
  if (_badges is EqualUnmodifiableMapView) return _badges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_badges);
}

@override@JsonKey() final  bool isLoading;

/// Create a copy of MainState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MainStateCopyWith<_MainState> get copyWith => __$MainStateCopyWithImpl<_MainState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MainState&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab)&&const DeepCollectionEquality().equals(other._pages, _pages)&&const DeepCollectionEquality().equals(other._badges, _badges)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,currentTab,const DeepCollectionEquality().hash(_pages),const DeepCollectionEquality().hash(_badges),isLoading);

@override
String toString() {
  return 'MainState(currentTab: $currentTab, pages: $pages, badges: $badges, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$MainStateCopyWith<$Res> implements $MainStateCopyWith<$Res> {
  factory _$MainStateCopyWith(_MainState value, $Res Function(_MainState) _then) = __$MainStateCopyWithImpl;
@override @useResult
$Res call({
 MainTab currentTab, Map<MainTab, Widget> pages, Map<MainTab, int> badges, bool isLoading
});


@override $MainTabCopyWith<$Res> get currentTab;

}
/// @nodoc
class __$MainStateCopyWithImpl<$Res>
    implements _$MainStateCopyWith<$Res> {
  __$MainStateCopyWithImpl(this._self, this._then);

  final _MainState _self;
  final $Res Function(_MainState) _then;

/// Create a copy of MainState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentTab = null,Object? pages = null,Object? badges = null,Object? isLoading = null,}) {
  return _then(_MainState(
currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as MainTab,pages: null == pages ? _self._pages : pages // ignore: cast_nullable_to_non_nullable
as Map<MainTab, Widget>,badges: null == badges ? _self._badges : badges // ignore: cast_nullable_to_non_nullable
as Map<MainTab, int>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MainState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MainTabCopyWith<$Res> get currentTab {
  
  return $MainTabCopyWith<$Res>(_self.currentTab, (value) {
    return _then(_self.copyWith(currentTab: value));
  });
}
}

/// @nodoc
mixin _$MainTab {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainTab);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MainTab()';
}


}

/// @nodoc
class $MainTabCopyWith<$Res>  {
$MainTabCopyWith(MainTab _, $Res Function(MainTab) __);
}


/// Adds pattern-matching-related methods to [MainTab].
extension MainTabPatterns on MainTab {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _HomeTab value)?  home,TResult Function( _SearchTab value)?  search,TResult Function( _FavoriteTab value)?  favorite,TResult Function( _ProfileTab value)?  profile,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeTab() when home != null:
return home(_that);case _SearchTab() when search != null:
return search(_that);case _FavoriteTab() when favorite != null:
return favorite(_that);case _ProfileTab() when profile != null:
return profile(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _HomeTab value)  home,required TResult Function( _SearchTab value)  search,required TResult Function( _FavoriteTab value)  favorite,required TResult Function( _ProfileTab value)  profile,}){
final _that = this;
switch (_that) {
case _HomeTab():
return home(_that);case _SearchTab():
return search(_that);case _FavoriteTab():
return favorite(_that);case _ProfileTab():
return profile(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _HomeTab value)?  home,TResult? Function( _SearchTab value)?  search,TResult? Function( _FavoriteTab value)?  favorite,TResult? Function( _ProfileTab value)?  profile,}){
final _that = this;
switch (_that) {
case _HomeTab() when home != null:
return home(_that);case _SearchTab() when search != null:
return search(_that);case _FavoriteTab() when favorite != null:
return favorite(_that);case _ProfileTab() when profile != null:
return profile(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  home,TResult Function()?  search,TResult Function()?  favorite,TResult Function()?  profile,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeTab() when home != null:
return home();case _SearchTab() when search != null:
return search();case _FavoriteTab() when favorite != null:
return favorite();case _ProfileTab() when profile != null:
return profile();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  home,required TResult Function()  search,required TResult Function()  favorite,required TResult Function()  profile,}) {final _that = this;
switch (_that) {
case _HomeTab():
return home();case _SearchTab():
return search();case _FavoriteTab():
return favorite();case _ProfileTab():
return profile();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  home,TResult? Function()?  search,TResult? Function()?  favorite,TResult? Function()?  profile,}) {final _that = this;
switch (_that) {
case _HomeTab() when home != null:
return home();case _SearchTab() when search != null:
return search();case _FavoriteTab() when favorite != null:
return favorite();case _ProfileTab() when profile != null:
return profile();case _:
  return null;

}
}

}

/// @nodoc


class _HomeTab extends MainTab {
  const _HomeTab(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeTab);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MainTab.home()';
}


}




/// @nodoc


class _SearchTab extends MainTab {
  const _SearchTab(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchTab);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MainTab.search()';
}


}




/// @nodoc


class _FavoriteTab extends MainTab {
  const _FavoriteTab(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteTab);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MainTab.favorite()';
}


}




/// @nodoc


class _ProfileTab extends MainTab {
  const _ProfileTab(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileTab);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MainTab.profile()';
}


}




// dart format on

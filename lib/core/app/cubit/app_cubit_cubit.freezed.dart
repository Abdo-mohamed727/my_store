// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_cubit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppCubitState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppCubitState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppCubitState()';
}


}

/// @nodoc
class $AppCubitStateCopyWith<$Res>  {
$AppCubitStateCopyWith(AppCubitState _, $Res Function(AppCubitState) __);
}


/// Adds pattern-matching-related methods to [AppCubitState].
extension AppCubitStatePatterns on AppCubitState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _ChangeThemeMode value)?  changeThemeMode,TResult Function( _ChangeLanguage value)?  changelanguage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _ChangeThemeMode() when changeThemeMode != null:
return changeThemeMode(_that);case _ChangeLanguage() when changelanguage != null:
return changelanguage(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _ChangeThemeMode value)  changeThemeMode,required TResult Function( _ChangeLanguage value)  changelanguage,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _ChangeThemeMode():
return changeThemeMode(_that);case _ChangeLanguage():
return changelanguage(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _ChangeThemeMode value)?  changeThemeMode,TResult? Function( _ChangeLanguage value)?  changelanguage,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _ChangeThemeMode() when changeThemeMode != null:
return changeThemeMode(_that);case _ChangeLanguage() when changelanguage != null:
return changelanguage(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( bool isDarkMode)?  changeThemeMode,TResult Function( Locale locale)?  changelanguage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _ChangeThemeMode() when changeThemeMode != null:
return changeThemeMode(_that.isDarkMode);case _ChangeLanguage() when changelanguage != null:
return changelanguage(_that.locale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( bool isDarkMode)  changeThemeMode,required TResult Function( Locale locale)  changelanguage,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _ChangeThemeMode():
return changeThemeMode(_that.isDarkMode);case _ChangeLanguage():
return changelanguage(_that.locale);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( bool isDarkMode)?  changeThemeMode,TResult? Function( Locale locale)?  changelanguage,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _ChangeThemeMode() when changeThemeMode != null:
return changeThemeMode(_that.isDarkMode);case _ChangeLanguage() when changelanguage != null:
return changelanguage(_that.locale);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AppCubitState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppCubitState.initial()';
}


}




/// @nodoc


class _ChangeThemeMode implements AppCubitState {
  const _ChangeThemeMode({required this.isDarkMode});
  

 final  bool isDarkMode;

/// Create a copy of AppCubitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeThemeModeCopyWith<_ChangeThemeMode> get copyWith => __$ChangeThemeModeCopyWithImpl<_ChangeThemeMode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeThemeMode&&(identical(other.isDarkMode, isDarkMode) || other.isDarkMode == isDarkMode));
}


@override
int get hashCode => Object.hash(runtimeType,isDarkMode);

@override
String toString() {
  return 'AppCubitState.changeThemeMode(isDarkMode: $isDarkMode)';
}


}

/// @nodoc
abstract mixin class _$ChangeThemeModeCopyWith<$Res> implements $AppCubitStateCopyWith<$Res> {
  factory _$ChangeThemeModeCopyWith(_ChangeThemeMode value, $Res Function(_ChangeThemeMode) _then) = __$ChangeThemeModeCopyWithImpl;
@useResult
$Res call({
 bool isDarkMode
});




}
/// @nodoc
class __$ChangeThemeModeCopyWithImpl<$Res>
    implements _$ChangeThemeModeCopyWith<$Res> {
  __$ChangeThemeModeCopyWithImpl(this._self, this._then);

  final _ChangeThemeMode _self;
  final $Res Function(_ChangeThemeMode) _then;

/// Create a copy of AppCubitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isDarkMode = null,}) {
  return _then(_ChangeThemeMode(
isDarkMode: null == isDarkMode ? _self.isDarkMode : isDarkMode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _ChangeLanguage implements AppCubitState {
  const _ChangeLanguage({required this.locale});
  

 final  Locale locale;

/// Create a copy of AppCubitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeLanguageCopyWith<_ChangeLanguage> get copyWith => __$ChangeLanguageCopyWithImpl<_ChangeLanguage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeLanguage&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,locale);

@override
String toString() {
  return 'AppCubitState.changelanguage(locale: $locale)';
}


}

/// @nodoc
abstract mixin class _$ChangeLanguageCopyWith<$Res> implements $AppCubitStateCopyWith<$Res> {
  factory _$ChangeLanguageCopyWith(_ChangeLanguage value, $Res Function(_ChangeLanguage) _then) = __$ChangeLanguageCopyWithImpl;
@useResult
$Res call({
 Locale locale
});




}
/// @nodoc
class __$ChangeLanguageCopyWithImpl<$Res>
    implements _$ChangeLanguageCopyWith<$Res> {
  __$ChangeLanguageCopyWithImpl(this._self, this._then);

  final _ChangeLanguage _self;
  final $Res Function(_ChangeLanguage) _then;

/// Create a copy of AppCubitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? locale = null,}) {
  return _then(_ChangeLanguage(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,
  ));
}


}

// dart format on

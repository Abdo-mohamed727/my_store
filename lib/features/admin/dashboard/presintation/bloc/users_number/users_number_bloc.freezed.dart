// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_number_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UsersNumberEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersNumberEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsersNumberEvent()';
}


}

/// @nodoc
class $UsersNumberEventCopyWith<$Res>  {
$UsersNumberEventCopyWith(UsersNumberEvent _, $Res Function(UsersNumberEvent) __);
}


/// Adds pattern-matching-related methods to [UsersNumberEvent].
extension UsersNumberEventPatterns on UsersNumberEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _GetUsersNumber value)?  getUsersNumber,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetUsersNumber() when getUsersNumber != null:
return getUsersNumber(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _GetUsersNumber value)  getUsersNumber,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _GetUsersNumber():
return getUsersNumber(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _GetUsersNumber value)?  getUsersNumber,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetUsersNumber() when getUsersNumber != null:
return getUsersNumber(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  getUsersNumber,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetUsersNumber() when getUsersNumber != null:
return getUsersNumber();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  getUsersNumber,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _GetUsersNumber():
return getUsersNumber();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  getUsersNumber,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetUsersNumber() when getUsersNumber != null:
return getUsersNumber();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements UsersNumberEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsersNumberEvent.started()';
}


}




/// @nodoc


class _GetUsersNumber implements UsersNumberEvent {
  const _GetUsersNumber();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetUsersNumber);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsersNumberEvent.getUsersNumber()';
}


}




/// @nodoc
mixin _$UsersNumberState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersNumberState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsersNumberState()';
}


}

/// @nodoc
class $UsersNumberStateCopyWith<$Res>  {
$UsersNumberStateCopyWith(UsersNumberState _, $Res Function(UsersNumberState) __);
}


/// Adds pattern-matching-related methods to [UsersNumberState].
extension UsersNumberStatePatterns on UsersNumberState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadingState value)?  loading,TResult Function( _SuccessState value)?  success,TResult Function( _ErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadingState() when loading != null:
return loading(_that);case _SuccessState() when success != null:
return success(_that);case _ErrorState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadingState value)  loading,required TResult Function( _SuccessState value)  success,required TResult Function( _ErrorState value)  error,}){
final _that = this;
switch (_that) {
case _LoadingState():
return loading(_that);case _SuccessState():
return success(_that);case _ErrorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadingState value)?  loading,TResult? Function( _SuccessState value)?  success,TResult? Function( _ErrorState value)?  error,}){
final _that = this;
switch (_that) {
case _LoadingState() when loading != null:
return loading(_that);case _SuccessState() when success != null:
return success(_that);case _ErrorState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String usersNumber)?  success,TResult Function( String errormessage)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadingState() when loading != null:
return loading();case _SuccessState() when success != null:
return success(_that.usersNumber);case _ErrorState() when error != null:
return error(_that.errormessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String usersNumber)  success,required TResult Function( String errormessage)  error,}) {final _that = this;
switch (_that) {
case _LoadingState():
return loading();case _SuccessState():
return success(_that.usersNumber);case _ErrorState():
return error(_that.errormessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String usersNumber)?  success,TResult? Function( String errormessage)?  error,}) {final _that = this;
switch (_that) {
case _LoadingState() when loading != null:
return loading();case _SuccessState() when success != null:
return success(_that.usersNumber);case _ErrorState() when error != null:
return error(_that.errormessage);case _:
  return null;

}
}

}

/// @nodoc


class _LoadingState implements UsersNumberState {
  const _LoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsersNumberState.loading()';
}


}




/// @nodoc


class _SuccessState implements UsersNumberState {
  const _SuccessState({required this.usersNumber});
  

 final  String usersNumber;

/// Create a copy of UsersNumberState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessStateCopyWith<_SuccessState> get copyWith => __$SuccessStateCopyWithImpl<_SuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessState&&(identical(other.usersNumber, usersNumber) || other.usersNumber == usersNumber));
}


@override
int get hashCode => Object.hash(runtimeType,usersNumber);

@override
String toString() {
  return 'UsersNumberState.success(usersNumber: $usersNumber)';
}


}

/// @nodoc
abstract mixin class _$SuccessStateCopyWith<$Res> implements $UsersNumberStateCopyWith<$Res> {
  factory _$SuccessStateCopyWith(_SuccessState value, $Res Function(_SuccessState) _then) = __$SuccessStateCopyWithImpl;
@useResult
$Res call({
 String usersNumber
});




}
/// @nodoc
class __$SuccessStateCopyWithImpl<$Res>
    implements _$SuccessStateCopyWith<$Res> {
  __$SuccessStateCopyWithImpl(this._self, this._then);

  final _SuccessState _self;
  final $Res Function(_SuccessState) _then;

/// Create a copy of UsersNumberState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? usersNumber = null,}) {
  return _then(_SuccessState(
usersNumber: null == usersNumber ? _self.usersNumber : usersNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ErrorState implements UsersNumberState {
  const _ErrorState({required this.errormessage});
  

 final  String errormessage;

/// Create a copy of UsersNumberState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorStateCopyWith<_ErrorState> get copyWith => __$ErrorStateCopyWithImpl<_ErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorState&&(identical(other.errormessage, errormessage) || other.errormessage == errormessage));
}


@override
int get hashCode => Object.hash(runtimeType,errormessage);

@override
String toString() {
  return 'UsersNumberState.error(errormessage: $errormessage)';
}


}

/// @nodoc
abstract mixin class _$ErrorStateCopyWith<$Res> implements $UsersNumberStateCopyWith<$Res> {
  factory _$ErrorStateCopyWith(_ErrorState value, $Res Function(_ErrorState) _then) = __$ErrorStateCopyWithImpl;
@useResult
$Res call({
 String errormessage
});




}
/// @nodoc
class __$ErrorStateCopyWithImpl<$Res>
    implements _$ErrorStateCopyWith<$Res> {
  __$ErrorStateCopyWithImpl(this._self, this._then);

  final _ErrorState _self;
  final $Res Function(_ErrorState) _then;

/// Create a copy of UsersNumberState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errormessage = null,}) {
  return _then(_ErrorState(
errormessage: null == errormessage ? _self.errormessage : errormessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

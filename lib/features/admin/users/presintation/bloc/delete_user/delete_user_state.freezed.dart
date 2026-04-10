// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeleteUserState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteUserState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteUserState()';
}


}

/// @nodoc
class $DeleteUserStateCopyWith<$Res>  {
$DeleteUserStateCopyWith(DeleteUserState _, $Res Function(DeleteUserState) __);
}


/// Adds pattern-matching-related methods to [DeleteUserState].
extension DeleteUserStatePatterns on DeleteUserState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( DeleteUserLoading value)?  loading,TResult Function( DeleteUserSuccess value)?  success,TResult Function( DeleteUserError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case DeleteUserLoading() when loading != null:
return loading(_that);case DeleteUserSuccess() when success != null:
return success(_that);case DeleteUserError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( DeleteUserLoading value)  loading,required TResult Function( DeleteUserSuccess value)  success,required TResult Function( DeleteUserError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case DeleteUserLoading():
return loading(_that);case DeleteUserSuccess():
return success(_that);case DeleteUserError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( DeleteUserLoading value)?  loading,TResult? Function( DeleteUserSuccess value)?  success,TResult? Function( DeleteUserError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case DeleteUserLoading() when loading != null:
return loading(_that);case DeleteUserSuccess() when success != null:
return success(_that);case DeleteUserError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String userId)?  loading,TResult Function( String userId)?  success,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case DeleteUserLoading() when loading != null:
return loading(_that.userId);case DeleteUserSuccess() when success != null:
return success(_that.userId);case DeleteUserError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String userId)  loading,required TResult Function( String userId)  success,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case DeleteUserLoading():
return loading(_that.userId);case DeleteUserSuccess():
return success(_that.userId);case DeleteUserError():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String userId)?  loading,TResult? Function( String userId)?  success,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case DeleteUserLoading() when loading != null:
return loading(_that.userId);case DeleteUserSuccess() when success != null:
return success(_that.userId);case DeleteUserError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements DeleteUserState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteUserState.initial()';
}


}




/// @nodoc


class DeleteUserLoading implements DeleteUserState {
  const DeleteUserLoading({required this.userId});
  

 final  String userId;

/// Create a copy of DeleteUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteUserLoadingCopyWith<DeleteUserLoading> get copyWith => _$DeleteUserLoadingCopyWithImpl<DeleteUserLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteUserLoading&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'DeleteUserState.loading(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $DeleteUserLoadingCopyWith<$Res> implements $DeleteUserStateCopyWith<$Res> {
  factory $DeleteUserLoadingCopyWith(DeleteUserLoading value, $Res Function(DeleteUserLoading) _then) = _$DeleteUserLoadingCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$DeleteUserLoadingCopyWithImpl<$Res>
    implements $DeleteUserLoadingCopyWith<$Res> {
  _$DeleteUserLoadingCopyWithImpl(this._self, this._then);

  final DeleteUserLoading _self;
  final $Res Function(DeleteUserLoading) _then;

/// Create a copy of DeleteUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(DeleteUserLoading(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DeleteUserSuccess implements DeleteUserState {
  const DeleteUserSuccess({required this.userId});
  

 final  String userId;

/// Create a copy of DeleteUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteUserSuccessCopyWith<DeleteUserSuccess> get copyWith => _$DeleteUserSuccessCopyWithImpl<DeleteUserSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteUserSuccess&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'DeleteUserState.success(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $DeleteUserSuccessCopyWith<$Res> implements $DeleteUserStateCopyWith<$Res> {
  factory $DeleteUserSuccessCopyWith(DeleteUserSuccess value, $Res Function(DeleteUserSuccess) _then) = _$DeleteUserSuccessCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$DeleteUserSuccessCopyWithImpl<$Res>
    implements $DeleteUserSuccessCopyWith<$Res> {
  _$DeleteUserSuccessCopyWithImpl(this._self, this._then);

  final DeleteUserSuccess _self;
  final $Res Function(DeleteUserSuccess) _then;

/// Create a copy of DeleteUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(DeleteUserSuccess(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DeleteUserError implements DeleteUserState {
  const DeleteUserError({required this.error});
  

 final  String error;

/// Create a copy of DeleteUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteUserErrorCopyWith<DeleteUserError> get copyWith => _$DeleteUserErrorCopyWithImpl<DeleteUserError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteUserError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'DeleteUserState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $DeleteUserErrorCopyWith<$Res> implements $DeleteUserStateCopyWith<$Res> {
  factory $DeleteUserErrorCopyWith(DeleteUserError value, $Res Function(DeleteUserError) _then) = _$DeleteUserErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$DeleteUserErrorCopyWithImpl<$Res>
    implements $DeleteUserErrorCopyWith<$Res> {
  _$DeleteUserErrorCopyWithImpl(this._self, this._then);

  final DeleteUserError _self;
  final $Res Function(DeleteUserError) _then;

/// Create a copy of DeleteUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(DeleteUserError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

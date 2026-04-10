// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_user_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeleteUserEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteUserEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteUserEvent()';
}


}

/// @nodoc
class $DeleteUserEventCopyWith<$Res>  {
$DeleteUserEventCopyWith(DeleteUserEvent _, $Res Function(DeleteUserEvent) __);
}


/// Adds pattern-matching-related methods to [DeleteUserEvent].
extension DeleteUserEventPatterns on DeleteUserEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _started value)?  started,TResult Function( RemoveUserEvent value)?  deleteUser,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _started() when started != null:
return started(_that);case RemoveUserEvent() when deleteUser != null:
return deleteUser(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _started value)  started,required TResult Function( RemoveUserEvent value)  deleteUser,}){
final _that = this;
switch (_that) {
case _started():
return started(_that);case RemoveUserEvent():
return deleteUser(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _started value)?  started,TResult? Function( RemoveUserEvent value)?  deleteUser,}){
final _that = this;
switch (_that) {
case _started() when started != null:
return started(_that);case RemoveUserEvent() when deleteUser != null:
return deleteUser(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String userId)?  deleteUser,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _started() when started != null:
return started();case RemoveUserEvent() when deleteUser != null:
return deleteUser(_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String userId)  deleteUser,}) {final _that = this;
switch (_that) {
case _started():
return started();case RemoveUserEvent():
return deleteUser(_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String userId)?  deleteUser,}) {final _that = this;
switch (_that) {
case _started() when started != null:
return started();case RemoveUserEvent() when deleteUser != null:
return deleteUser(_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class _started implements DeleteUserEvent {
  const _started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteUserEvent.started()';
}


}




/// @nodoc


class RemoveUserEvent implements DeleteUserEvent {
  const RemoveUserEvent({required this.userId});
  

 final  String userId;

/// Create a copy of DeleteUserEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveUserEventCopyWith<RemoveUserEvent> get copyWith => _$RemoveUserEventCopyWithImpl<RemoveUserEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveUserEvent&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'DeleteUserEvent.deleteUser(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $RemoveUserEventCopyWith<$Res> implements $DeleteUserEventCopyWith<$Res> {
  factory $RemoveUserEventCopyWith(RemoveUserEvent value, $Res Function(RemoveUserEvent) _then) = _$RemoveUserEventCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$RemoveUserEventCopyWithImpl<$Res>
    implements $RemoveUserEventCopyWith<$Res> {
  _$RemoveUserEventCopyWithImpl(this._self, this._then);

  final RemoveUserEvent _self;
  final $Res Function(RemoveUserEvent) _then;

/// Create a copy of DeleteUserEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(RemoveUserEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

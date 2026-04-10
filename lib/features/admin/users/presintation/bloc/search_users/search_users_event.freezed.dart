// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_users_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchUsersEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchUsersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchUsersEvent()';
}


}

/// @nodoc
class $SearchUsersEventCopyWith<$Res>  {
$SearchUsersEventCopyWith(SearchUsersEvent _, $Res Function(SearchUsersEvent) __);
}


/// Adds pattern-matching-related methods to [SearchUsersEvent].
extension SearchUsersEventPatterns on SearchUsersEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _started value)?  started,TResult Function( FetchSearchUsersEvent value)?  fetchUsersSearch,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _started() when started != null:
return started(_that);case FetchSearchUsersEvent() when fetchUsersSearch != null:
return fetchUsersSearch(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _started value)  started,required TResult Function( FetchSearchUsersEvent value)  fetchUsersSearch,}){
final _that = this;
switch (_that) {
case _started():
return started(_that);case FetchSearchUsersEvent():
return fetchUsersSearch(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _started value)?  started,TResult? Function( FetchSearchUsersEvent value)?  fetchUsersSearch,}){
final _that = this;
switch (_that) {
case _started() when started != null:
return started(_that);case FetchSearchUsersEvent() when fetchUsersSearch != null:
return fetchUsersSearch(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String name)?  fetchUsersSearch,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _started() when started != null:
return started();case FetchSearchUsersEvent() when fetchUsersSearch != null:
return fetchUsersSearch(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String name)  fetchUsersSearch,}) {final _that = this;
switch (_that) {
case _started():
return started();case FetchSearchUsersEvent():
return fetchUsersSearch(_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String name)?  fetchUsersSearch,}) {final _that = this;
switch (_that) {
case _started() when started != null:
return started();case FetchSearchUsersEvent() when fetchUsersSearch != null:
return fetchUsersSearch(_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _started implements SearchUsersEvent {
  const _started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchUsersEvent.started()';
}


}




/// @nodoc


class FetchSearchUsersEvent implements SearchUsersEvent {
  const FetchSearchUsersEvent({required this.name});
  

 final  String name;

/// Create a copy of SearchUsersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchSearchUsersEventCopyWith<FetchSearchUsersEvent> get copyWith => _$FetchSearchUsersEventCopyWithImpl<FetchSearchUsersEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchSearchUsersEvent&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'SearchUsersEvent.fetchUsersSearch(name: $name)';
}


}

/// @nodoc
abstract mixin class $FetchSearchUsersEventCopyWith<$Res> implements $SearchUsersEventCopyWith<$Res> {
  factory $FetchSearchUsersEventCopyWith(FetchSearchUsersEvent value, $Res Function(FetchSearchUsersEvent) _then) = _$FetchSearchUsersEventCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$FetchSearchUsersEventCopyWithImpl<$Res>
    implements $FetchSearchUsersEventCopyWith<$Res> {
  _$FetchSearchUsersEventCopyWithImpl(this._self, this._then);

  final FetchSearchUsersEvent _self;
  final $Res Function(FetchSearchUsersEvent) _then;

/// Create a copy of SearchUsersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(FetchSearchUsersEvent(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

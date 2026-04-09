// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_category_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateCategoryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCategoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateCategoryEvent()';
}


}

/// @nodoc
class $CreateCategoryEventCopyWith<$Res>  {
$CreateCategoryEventCopyWith(CreateCategoryEvent _, $Res Function(CreateCategoryEvent) __);
}


/// Adds pattern-matching-related methods to [CreateCategoryEvent].
extension CreateCategoryEventPatterns on CreateCategoryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _CreateCategory value)?  createCategory,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _CreateCategory() when createCategory != null:
return createCategory(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _CreateCategory value)  createCategory,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _CreateCategory():
return createCategory(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _CreateCategory value)?  createCategory,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _CreateCategory() when createCategory != null:
return createCategory(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( CreateCategoryRequestBody body)?  createCategory,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _CreateCategory() when createCategory != null:
return createCategory(_that.body);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( CreateCategoryRequestBody body)  createCategory,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _CreateCategory():
return createCategory(_that.body);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( CreateCategoryRequestBody body)?  createCategory,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _CreateCategory() when createCategory != null:
return createCategory(_that.body);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements CreateCategoryEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateCategoryEvent.started()';
}


}




/// @nodoc


class _CreateCategory implements CreateCategoryEvent {
  const _CreateCategory({required this.body});
  

 final  CreateCategoryRequestBody body;

/// Create a copy of CreateCategoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCategoryCopyWith<_CreateCategory> get copyWith => __$CreateCategoryCopyWithImpl<_CreateCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateCategory&&(identical(other.body, body) || other.body == body));
}


@override
int get hashCode => Object.hash(runtimeType,body);

@override
String toString() {
  return 'CreateCategoryEvent.createCategory(body: $body)';
}


}

/// @nodoc
abstract mixin class _$CreateCategoryCopyWith<$Res> implements $CreateCategoryEventCopyWith<$Res> {
  factory _$CreateCategoryCopyWith(_CreateCategory value, $Res Function(_CreateCategory) _then) = __$CreateCategoryCopyWithImpl;
@useResult
$Res call({
 CreateCategoryRequestBody body
});




}
/// @nodoc
class __$CreateCategoryCopyWithImpl<$Res>
    implements _$CreateCategoryCopyWith<$Res> {
  __$CreateCategoryCopyWithImpl(this._self, this._then);

  final _CreateCategory _self;
  final $Res Function(_CreateCategory) _then;

/// Create a copy of CreateCategoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? body = null,}) {
  return _then(_CreateCategory(
body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as CreateCategoryRequestBody,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_product_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdateProductEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProductEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProductEvent()';
}


}

/// @nodoc
class $UpdateProductEventCopyWith<$Res>  {
$UpdateProductEventCopyWith(UpdateProductEvent _, $Res Function(UpdateProductEvent) __);
}


/// Adds pattern-matching-related methods to [UpdateProductEvent].
extension UpdateProductEventPatterns on UpdateProductEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _UpdateProduct value)?  updateProduct,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UpdateProduct() when updateProduct != null:
return updateProduct(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _UpdateProduct value)  updateProduct,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _UpdateProduct():
return updateProduct(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _UpdateProduct value)?  updateProduct,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UpdateProduct() when updateProduct != null:
return updateProduct(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( UpdateProductRequestBody body)?  updateProduct,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UpdateProduct() when updateProduct != null:
return updateProduct(_that.body);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( UpdateProductRequestBody body)  updateProduct,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _UpdateProduct():
return updateProduct(_that.body);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( UpdateProductRequestBody body)?  updateProduct,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UpdateProduct() when updateProduct != null:
return updateProduct(_that.body);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements UpdateProductEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProductEvent.started()';
}


}




/// @nodoc


class _UpdateProduct implements UpdateProductEvent {
  const _UpdateProduct({required this.body});
  

 final  UpdateProductRequestBody body;

/// Create a copy of UpdateProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProductCopyWith<_UpdateProduct> get copyWith => __$UpdateProductCopyWithImpl<_UpdateProduct>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProduct&&(identical(other.body, body) || other.body == body));
}


@override
int get hashCode => Object.hash(runtimeType,body);

@override
String toString() {
  return 'UpdateProductEvent.updateProduct(body: $body)';
}


}

/// @nodoc
abstract mixin class _$UpdateProductCopyWith<$Res> implements $UpdateProductEventCopyWith<$Res> {
  factory _$UpdateProductCopyWith(_UpdateProduct value, $Res Function(_UpdateProduct) _then) = __$UpdateProductCopyWithImpl;
@useResult
$Res call({
 UpdateProductRequestBody body
});




}
/// @nodoc
class __$UpdateProductCopyWithImpl<$Res>
    implements _$UpdateProductCopyWith<$Res> {
  __$UpdateProductCopyWithImpl(this._self, this._then);

  final _UpdateProduct _self;
  final $Res Function(_UpdateProduct) _then;

/// Create a copy of UpdateProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? body = null,}) {
  return _then(_UpdateProduct(
body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as UpdateProductRequestBody,
  ));
}


}

// dart format on

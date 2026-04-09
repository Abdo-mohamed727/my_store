// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_product_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateProductEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProductEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateProductEvent()';
}


}

/// @nodoc
class $CreateProductEventCopyWith<$Res>  {
$CreateProductEventCopyWith(CreateProductEvent _, $Res Function(CreateProductEvent) __);
}


/// Adds pattern-matching-related methods to [CreateProductEvent].
extension CreateProductEventPatterns on CreateProductEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _started value)?  started,TResult Function( _CreateProduct value)?  createProduct,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _started() when started != null:
return started(_that);case _CreateProduct() when createProduct != null:
return createProduct(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _started value)  started,required TResult Function( _CreateProduct value)  createProduct,}){
final _that = this;
switch (_that) {
case _started():
return started(_that);case _CreateProduct():
return createProduct(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _started value)?  started,TResult? Function( _CreateProduct value)?  createProduct,}){
final _that = this;
switch (_that) {
case _started() when started != null:
return started(_that);case _CreateProduct() when createProduct != null:
return createProduct(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( CreateProductRequestBody body)?  createProduct,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _started() when started != null:
return started();case _CreateProduct() when createProduct != null:
return createProduct(_that.body);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( CreateProductRequestBody body)  createProduct,}) {final _that = this;
switch (_that) {
case _started():
return started();case _CreateProduct():
return createProduct(_that.body);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( CreateProductRequestBody body)?  createProduct,}) {final _that = this;
switch (_that) {
case _started() when started != null:
return started();case _CreateProduct() when createProduct != null:
return createProduct(_that.body);case _:
  return null;

}
}

}

/// @nodoc


class _started implements CreateProductEvent {
  const _started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateProductEvent.started()';
}


}




/// @nodoc


class _CreateProduct implements CreateProductEvent {
  const _CreateProduct({required this.body});
  

 final  CreateProductRequestBody body;

/// Create a copy of CreateProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateProductCopyWith<_CreateProduct> get copyWith => __$CreateProductCopyWithImpl<_CreateProduct>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateProduct&&(identical(other.body, body) || other.body == body));
}


@override
int get hashCode => Object.hash(runtimeType,body);

@override
String toString() {
  return 'CreateProductEvent.createProduct(body: $body)';
}


}

/// @nodoc
abstract mixin class _$CreateProductCopyWith<$Res> implements $CreateProductEventCopyWith<$Res> {
  factory _$CreateProductCopyWith(_CreateProduct value, $Res Function(_CreateProduct) _then) = __$CreateProductCopyWithImpl;
@useResult
$Res call({
 CreateProductRequestBody body
});




}
/// @nodoc
class __$CreateProductCopyWithImpl<$Res>
    implements _$CreateProductCopyWith<$Res> {
  __$CreateProductCopyWithImpl(this._self, this._then);

  final _CreateProduct _self;
  final $Res Function(_CreateProduct) _then;

/// Create a copy of CreateProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? body = null,}) {
  return _then(_CreateProduct(
body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as CreateProductRequestBody,
  ));
}


}

// dart format on

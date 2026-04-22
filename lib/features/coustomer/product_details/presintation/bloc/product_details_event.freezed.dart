// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_details_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductDetailsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDetailsEvent()';
}


}

/// @nodoc
class $ProductDetailsEventCopyWith<$Res>  {
$ProductDetailsEventCopyWith(ProductDetailsEvent _, $Res Function(ProductDetailsEvent) __);
}


/// Adds pattern-matching-related methods to [ProductDetailsEvent].
extension ProductDetailsEventPatterns on ProductDetailsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _started value)?  started,TResult Function( FetchProductDetailsEvent value)?  fetchProductDetails,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _started() when started != null:
return started(_that);case FetchProductDetailsEvent() when fetchProductDetails != null:
return fetchProductDetails(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _started value)  started,required TResult Function( FetchProductDetailsEvent value)  fetchProductDetails,}){
final _that = this;
switch (_that) {
case _started():
return started(_that);case FetchProductDetailsEvent():
return fetchProductDetails(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _started value)?  started,TResult? Function( FetchProductDetailsEvent value)?  fetchProductDetails,}){
final _that = this;
switch (_that) {
case _started() when started != null:
return started(_that);case FetchProductDetailsEvent() when fetchProductDetails != null:
return fetchProductDetails(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String productId)?  fetchProductDetails,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _started() when started != null:
return started();case FetchProductDetailsEvent() when fetchProductDetails != null:
return fetchProductDetails(_that.productId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String productId)  fetchProductDetails,}) {final _that = this;
switch (_that) {
case _started():
return started();case FetchProductDetailsEvent():
return fetchProductDetails(_that.productId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String productId)?  fetchProductDetails,}) {final _that = this;
switch (_that) {
case _started() when started != null:
return started();case FetchProductDetailsEvent() when fetchProductDetails != null:
return fetchProductDetails(_that.productId);case _:
  return null;

}
}

}

/// @nodoc


class _started implements ProductDetailsEvent {
  const _started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDetailsEvent.started()';
}


}




/// @nodoc


class FetchProductDetailsEvent implements ProductDetailsEvent {
  const FetchProductDetailsEvent({required this.productId});
  

 final  String productId;

/// Create a copy of ProductDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchProductDetailsEventCopyWith<FetchProductDetailsEvent> get copyWith => _$FetchProductDetailsEventCopyWithImpl<FetchProductDetailsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchProductDetailsEvent&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'ProductDetailsEvent.fetchProductDetails(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $FetchProductDetailsEventCopyWith<$Res> implements $ProductDetailsEventCopyWith<$Res> {
  factory $FetchProductDetailsEventCopyWith(FetchProductDetailsEvent value, $Res Function(FetchProductDetailsEvent) _then) = _$FetchProductDetailsEventCopyWithImpl;
@useResult
$Res call({
 String productId
});




}
/// @nodoc
class _$FetchProductDetailsEventCopyWithImpl<$Res>
    implements $FetchProductDetailsEventCopyWith<$Res> {
  _$FetchProductDetailsEventCopyWithImpl(this._self, this._then);

  final FetchProductDetailsEvent _self;
  final $Res Function(FetchProductDetailsEvent) _then;

/// Create a copy of ProductDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(FetchProductDetailsEvent(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

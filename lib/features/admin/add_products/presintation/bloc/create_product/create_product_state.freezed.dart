// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateProductState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProductState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateProductState()';
}


}

/// @nodoc
class $CreateProductStateCopyWith<$Res>  {
$CreateProductStateCopyWith(CreateProductState _, $Res Function(CreateProductState) __);
}


/// Adds pattern-matching-related methods to [CreateProductState].
extension CreateProductStatePatterns on CreateProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitialCreateProduct value)?  initial,TResult Function( _LoadingCreateProduct value)?  loading,TResult Function( _SuccessCreateProduct value)?  success,TResult Function( _ErrorCreateProduct value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitialCreateProduct() when initial != null:
return initial(_that);case _LoadingCreateProduct() when loading != null:
return loading(_that);case _SuccessCreateProduct() when success != null:
return success(_that);case _ErrorCreateProduct() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitialCreateProduct value)  initial,required TResult Function( _LoadingCreateProduct value)  loading,required TResult Function( _SuccessCreateProduct value)  success,required TResult Function( _ErrorCreateProduct value)  error,}){
final _that = this;
switch (_that) {
case _InitialCreateProduct():
return initial(_that);case _LoadingCreateProduct():
return loading(_that);case _SuccessCreateProduct():
return success(_that);case _ErrorCreateProduct():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitialCreateProduct value)?  initial,TResult? Function( _LoadingCreateProduct value)?  loading,TResult? Function( _SuccessCreateProduct value)?  success,TResult? Function( _ErrorCreateProduct value)?  error,}){
final _that = this;
switch (_that) {
case _InitialCreateProduct() when initial != null:
return initial(_that);case _LoadingCreateProduct() when loading != null:
return loading(_that);case _SuccessCreateProduct() when success != null:
return success(_that);case _ErrorCreateProduct() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( CreateProductResponse response)?  success,TResult Function( String errorMessage)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitialCreateProduct() when initial != null:
return initial();case _LoadingCreateProduct() when loading != null:
return loading();case _SuccessCreateProduct() when success != null:
return success(_that.response);case _ErrorCreateProduct() when error != null:
return error(_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( CreateProductResponse response)  success,required TResult Function( String errorMessage)  error,}) {final _that = this;
switch (_that) {
case _InitialCreateProduct():
return initial();case _LoadingCreateProduct():
return loading();case _SuccessCreateProduct():
return success(_that.response);case _ErrorCreateProduct():
return error(_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( CreateProductResponse response)?  success,TResult? Function( String errorMessage)?  error,}) {final _that = this;
switch (_that) {
case _InitialCreateProduct() when initial != null:
return initial();case _LoadingCreateProduct() when loading != null:
return loading();case _SuccessCreateProduct() when success != null:
return success(_that.response);case _ErrorCreateProduct() when error != null:
return error(_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _InitialCreateProduct implements CreateProductState {
  const _InitialCreateProduct();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitialCreateProduct);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateProductState.initial()';
}


}




/// @nodoc


class _LoadingCreateProduct implements CreateProductState {
  const _LoadingCreateProduct();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingCreateProduct);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateProductState.loading()';
}


}




/// @nodoc


class _SuccessCreateProduct implements CreateProductState {
  const _SuccessCreateProduct({required this.response});
  

 final  CreateProductResponse response;

/// Create a copy of CreateProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCreateProductCopyWith<_SuccessCreateProduct> get copyWith => __$SuccessCreateProductCopyWithImpl<_SuccessCreateProduct>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessCreateProduct&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'CreateProductState.success(response: $response)';
}


}

/// @nodoc
abstract mixin class _$SuccessCreateProductCopyWith<$Res> implements $CreateProductStateCopyWith<$Res> {
  factory _$SuccessCreateProductCopyWith(_SuccessCreateProduct value, $Res Function(_SuccessCreateProduct) _then) = __$SuccessCreateProductCopyWithImpl;
@useResult
$Res call({
 CreateProductResponse response
});




}
/// @nodoc
class __$SuccessCreateProductCopyWithImpl<$Res>
    implements _$SuccessCreateProductCopyWith<$Res> {
  __$SuccessCreateProductCopyWithImpl(this._self, this._then);

  final _SuccessCreateProduct _self;
  final $Res Function(_SuccessCreateProduct) _then;

/// Create a copy of CreateProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(_SuccessCreateProduct(
response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as CreateProductResponse,
  ));
}


}

/// @nodoc


class _ErrorCreateProduct implements CreateProductState {
  const _ErrorCreateProduct({required this.errorMessage});
  

 final  String errorMessage;

/// Create a copy of CreateProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCreateProductCopyWith<_ErrorCreateProduct> get copyWith => __$ErrorCreateProductCopyWithImpl<_ErrorCreateProduct>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorCreateProduct&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'CreateProductState.error(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ErrorCreateProductCopyWith<$Res> implements $CreateProductStateCopyWith<$Res> {
  factory _$ErrorCreateProductCopyWith(_ErrorCreateProduct value, $Res Function(_ErrorCreateProduct) _then) = __$ErrorCreateProductCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class __$ErrorCreateProductCopyWithImpl<$Res>
    implements _$ErrorCreateProductCopyWith<$Res> {
  __$ErrorCreateProductCopyWithImpl(this._self, this._then);

  final _ErrorCreateProduct _self;
  final $Res Function(_ErrorCreateProduct) _then;

/// Create a copy of CreateProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(_ErrorCreateProduct(
errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

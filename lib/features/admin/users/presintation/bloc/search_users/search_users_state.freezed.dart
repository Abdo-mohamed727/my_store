// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_users_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchUsersState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchUsersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchUsersState()';
}


}

/// @nodoc
class $SearchUsersStateCopyWith<$Res>  {
$SearchUsersStateCopyWith(SearchUsersState _, $Res Function(SearchUsersState) __);
}


/// Adds pattern-matching-related methods to [SearchUsersState].
extension SearchUsersStatePatterns on SearchUsersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( SearchUsersLoading value)?  loading,TResult Function( SearchUsersSuccess value)?  success,TResult Function( SearchUsersError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SearchUsersLoading() when loading != null:
return loading(_that);case SearchUsersSuccess() when success != null:
return success(_that);case SearchUsersError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( SearchUsersLoading value)  loading,required TResult Function( SearchUsersSuccess value)  success,required TResult Function( SearchUsersError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case SearchUsersLoading():
return loading(_that);case SearchUsersSuccess():
return success(_that);case SearchUsersError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( SearchUsersLoading value)?  loading,TResult? Function( SearchUsersSuccess value)?  success,TResult? Function( SearchUsersError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SearchUsersLoading() when loading != null:
return loading(_that);case SearchUsersSuccess() when success != null:
return success(_that);case SearchUsersError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( GetAllUsersResponse response)?  success,TResult Function( String errorMessage)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SearchUsersLoading() when loading != null:
return loading();case SearchUsersSuccess() when success != null:
return success(_that.response);case SearchUsersError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( GetAllUsersResponse response)  success,required TResult Function( String errorMessage)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case SearchUsersLoading():
return loading();case SearchUsersSuccess():
return success(_that.response);case SearchUsersError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( GetAllUsersResponse response)?  success,TResult? Function( String errorMessage)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SearchUsersLoading() when loading != null:
return loading();case SearchUsersSuccess() when success != null:
return success(_that.response);case SearchUsersError() when error != null:
return error(_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SearchUsersState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchUsersState.initial()';
}


}




/// @nodoc


class SearchUsersLoading implements SearchUsersState {
  const SearchUsersLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchUsersLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchUsersState.loading()';
}


}




/// @nodoc


class SearchUsersSuccess implements SearchUsersState {
  const SearchUsersSuccess({required this.response});
  

 final  GetAllUsersResponse response;

/// Create a copy of SearchUsersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchUsersSuccessCopyWith<SearchUsersSuccess> get copyWith => _$SearchUsersSuccessCopyWithImpl<SearchUsersSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchUsersSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'SearchUsersState.success(response: $response)';
}


}

/// @nodoc
abstract mixin class $SearchUsersSuccessCopyWith<$Res> implements $SearchUsersStateCopyWith<$Res> {
  factory $SearchUsersSuccessCopyWith(SearchUsersSuccess value, $Res Function(SearchUsersSuccess) _then) = _$SearchUsersSuccessCopyWithImpl;
@useResult
$Res call({
 GetAllUsersResponse response
});




}
/// @nodoc
class _$SearchUsersSuccessCopyWithImpl<$Res>
    implements $SearchUsersSuccessCopyWith<$Res> {
  _$SearchUsersSuccessCopyWithImpl(this._self, this._then);

  final SearchUsersSuccess _self;
  final $Res Function(SearchUsersSuccess) _then;

/// Create a copy of SearchUsersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(SearchUsersSuccess(
response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as GetAllUsersResponse,
  ));
}


}

/// @nodoc


class SearchUsersError implements SearchUsersState {
  const SearchUsersError({required this.errorMessage});
  

 final  String errorMessage;

/// Create a copy of SearchUsersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchUsersErrorCopyWith<SearchUsersError> get copyWith => _$SearchUsersErrorCopyWithImpl<SearchUsersError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchUsersError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'SearchUsersState.error(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SearchUsersErrorCopyWith<$Res> implements $SearchUsersStateCopyWith<$Res> {
  factory $SearchUsersErrorCopyWith(SearchUsersError value, $Res Function(SearchUsersError) _then) = _$SearchUsersErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$SearchUsersErrorCopyWithImpl<$Res>
    implements $SearchUsersErrorCopyWith<$Res> {
  _$SearchUsersErrorCopyWithImpl(this._self, this._then);

  final SearchUsersError _self;
  final $Res Function(SearchUsersError) _then;

/// Create a copy of SearchUsersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(SearchUsersError(
errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

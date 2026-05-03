import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/coustomer/cart/data/cart_item.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = _Loading;
  const factory CartState.loaded({
    required List<CartItem> items,
    required double totalPrice,
  }) = _Loaded;
  const factory CartState.error({required String message}) = _Error;
}

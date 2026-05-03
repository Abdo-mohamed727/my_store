import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/coustomer/cart/data/cart_item.dart';
import 'package:my_store/features/coustomer/cart/data/repositories/cart_repository_impl.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepositoryImpl repository;

  CartCubit({required this.repository}) : super(const CartState.initial());

  Future<void> loadCart() async {
    emit(const CartState.loading());
    try {
      final items = await repository.getCartItems();
      final totalPrice = _calculateTotal(items);
      emit(CartState.loaded(items: items, totalPrice: totalPrice));
    } catch (e) {
      emit(CartState.error(message: e.toString()));
    }
  }

  Future<void> addToCart(CartItem item) async {
    try {
      // Keep previous state if possible, but we'll reload anyway to keep it simple and robust
      await repository.addToCart(item);
      await loadCart();
    } catch (e) {
      emit(CartState.error(message: e.toString()));
    }
  }

  Future<void> removeFromCart(dynamic productId) async {
    try {
      await repository.removeFromCart(productId);
      await loadCart();
    } catch (e) {
      emit(CartState.error(message: e.toString()));
    }
  }

  Future<void> clearCart() async {
    try {
      await repository.clearCart();
      await loadCart();
    } catch (e) {
      emit(CartState.error(message: e.toString()));
    }
  }

  double _calculateTotal(List<CartItem> items) {
    return items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }
}

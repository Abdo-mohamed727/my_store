import '../cart_item.dart';
import '../data_sources/local_cart_data_source.dart';

abstract class CartRepository {
  Future<List<CartItem>> getCartItems();
  Future<void> addToCart(CartItem item);
  Future<void> removeFromCart(dynamic productId);
  Future<void> clearCart();
}

class CartRepositoryImpl implements CartRepository {
  final LocalCartDataSource localDataSource;

  CartRepositoryImpl({required this.localDataSource});

  @override
  Future<List<CartItem>> getCartItems() {
    return localDataSource.getCartItems();
  }

  @override
  Future<void> addToCart(CartItem item) {
    return localDataSource.addToCart(item);
  }

  @override
  Future<void> removeFromCart(dynamic productId) {
    return localDataSource.removeFromCart(productId);
  }

  @override
  Future<void> clearCart() {
    return localDataSource.clearCart();
  }
}

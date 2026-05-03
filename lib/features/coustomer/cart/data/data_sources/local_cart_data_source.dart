import '../cart_item.dart';

abstract class LocalCartDataSource {
  Future<List<CartItem>> getCartItems();
  Future<void> addToCart(CartItem item);
  Future<void> removeFromCart(dynamic productId);
  Future<void> clearCart();
}

class LocalCartDataSourceImpl implements LocalCartDataSource {
  final List<CartItem> _items = [];

  @override
  Future<List<CartItem>> getCartItems() async {
    // Simulate slight delay
    await Future.delayed(const Duration(milliseconds: 100));
    return List.unmodifiable(_items);
  }

  @override
  Future<void> addToCart(CartItem item) async {
    final existingIndex = _items.indexWhere((i) => i.productId == item.productId);
    if (existingIndex >= 0) {
      final existingItem = _items[existingIndex];
      _items[existingIndex] = existingItem.copyWith(quantity: existingItem.quantity + item.quantity);
    } else {
      _items.add(item);
    }
  }

  @override
  Future<void> removeFromCart(dynamic productId) async {
    _items.removeWhere((item) => item.productId == productId);
  }

  @override
  Future<void> clearCart() async {
    _items.clear();
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repository/sales_repository.dart';

/// Sales repository provider
final salesRepositoryProvider = Provider<SalesRepository>((ref) {
  return MockSalesRepository();
});

/// Cart state
class CartState {
  final List<CartItem> items;
  final double discount;
  final String? customerId;

  CartState({
    this.items = const [],
    this.discount = 0,
    this.customerId,
  });

  double get subtotal => items.fold(0, (sum, item) => sum + item.total);
  double get total => subtotal - discount;
  int get itemCount => items.length;

  CartState copyWith({
    List<CartItem>? items,
    double? discount,
    String? customerId,
  }) {
    return CartState(
      items: items ?? this.items,
      discount: discount ?? this.discount,
      customerId: customerId ?? this.customerId,
    );
  }
}

class CartItem {
  final String productId;
  final String productName;
  final String? variant;
  final double price;
  final int quantity;

  CartItem({
    required this.productId,
    required this.productName,
    this.variant,
    required this.price,
    required this.quantity,
  });

  double get total => price * quantity;

  CartItem copyWith({int? quantity}) {
    return CartItem(
      productId: productId,
      productName: productName,
      variant: variant,
      price: price,
      quantity: quantity ?? this.quantity,
    );
  }
}

/// Cart notifier
class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(CartState());

  void addItem(CartItem item) {
    final existingIndex = state.items.indexWhere(
      (i) => i.productId == item.productId && i.variant == item.variant,
    );

    if (existingIndex >= 0) {
      final existing = state.items[existingIndex];
      final updatedItems = [...state.items];
      updatedItems[existingIndex] = existing.copyWith(
        quantity: existing.quantity + item.quantity,
      );
      state = state.copyWith(items: updatedItems);
    } else {
      state = state.copyWith(items: [...state.items, item]);
    }
  }

  void updateQuantity(String productId, int quantity) {
    final items = state.items.map((item) {
      if (item.productId == productId) {
        return item.copyWith(quantity: quantity);
      }
      return item;
    }).where((item) => item.quantity > 0).toList();
    
    state = state.copyWith(items: items);
  }

  void removeItem(String productId) {
    final items = state.items.where((i) => i.productId != productId).toList();
    state = state.copyWith(items: items);
  }

  void setDiscount(double discount) {
    state = state.copyWith(discount: discount);
  }

  void clearCart() {
    state = CartState();
  }
}

/// Cart provider
final cartProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier();
});

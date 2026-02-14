part of 'cart_cubit.dart';

class CartState {
  final List<CartItem> items;

  CartState({required this.items});
  ///  Total (cash)
  double get total =>
      items.fold(0, (sum, item) => sum + item.total);

  /// 🛒 Total item units (for badge)
  int get totalItems =>
      items.fold(0, (sum, item) => sum + item.quantity);

  CartState copyWith({List<CartItem>? items}) {
    return CartState(
      items: items ?? this.items,
    );
  }
}
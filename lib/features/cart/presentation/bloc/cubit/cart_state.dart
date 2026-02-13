part of 'cart_cubit.dart';

class CartState {
  final List<CartItem> items;

  CartState({required this.items});

  double get total =>
      items.fold(0, (sum, item) => sum + item.total);

  CartState copyWith({List<CartItem>? items}) {
    return CartState(
      items: items ?? this.items,
    );
  }
}
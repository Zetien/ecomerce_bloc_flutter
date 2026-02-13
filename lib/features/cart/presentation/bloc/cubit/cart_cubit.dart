import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_z_comerce/features/cart/domain/entities/cart_item.dart';
import 'package:smart_z_comerce/features/products/domain/entities/product.dart';

part 'cart_state.dart';



class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(items: []));

  void addProduct(Product product) {
    final existingIndex =
        state.items.indexWhere((item) => item.product.id == product.id);

    if (existingIndex != -1) {
      final updatedItems = [...state.items];
      final existingItem = updatedItems[existingIndex];

      updatedItems[existingIndex] =
          existingItem.copyWith(quantity: existingItem.quantity + 1);

      emit(state.copyWith(items: updatedItems));
    } else {
      emit(state.copyWith(
        items: [...state.items, CartItem(product: product, quantity: 1)],
      ));
    }
  }

  void increaseQuantity(Product product) {
    addProduct(product);
  }

  void decreaseQuantity(Product product) {
    final updatedItems = state.items.map((item) {
      if (item.product.id == product.id) {
        if (item.quantity > 1) {
          return item.copyWith(quantity: item.quantity - 1);
        }
      }
      return item;
    }).where((item) => item.quantity > 0).toList();

    emit(state.copyWith(items: updatedItems));
  }

  void removeProduct(Product product) {
    emit(state.copyWith(
      items: state.items
          .where((item) => item.product.id != product.id)
          .toList(),
    ));
  }

  void clearCart() {
    emit(CartState(items: []));
  }
}

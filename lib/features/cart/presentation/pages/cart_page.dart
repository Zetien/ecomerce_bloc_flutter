import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_z_comerce/features/cart/presentation/bloc/cubit/cart_cubit.dart';
import 'package:smart_z_comerce/features/cart/presentation/pages/checkout_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Carrito")),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cartItems = state.items;

          if (cartItems.isEmpty) {
            return const Center(child: Text("El carrito está vacío"));
          }

          double total = 0;
          for (var item in cartItems) {
            total += item.product.price * item.quantity;
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];

                    return Dismissible(
                      key: ValueKey(item.product.id),

                      direction:
                          DismissDirection.endToStart, // 👉 derecha → izquierda

                      confirmDismiss: (_) async {
                        return await showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text("Eliminar producto"),
                            content: const Text(
                              "¿Seguro que deseas eliminarlo del carrito?",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text("Cancelar"),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text("Eliminar"),
                              ),
                            ],
                          ),
                        );
                      },

                      onDismissed: (_) {
                        context.read<CartCubit>().removeProduct(item.product);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${item.product.title} eliminado"),
                          ),
                        );
                      },

                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.red,
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),

                      child: ListTile(
                        leading: Image.network(item.product.image, width: 50),

                        title: Text(item.product.title),

                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("\$${item.product.price}"),

                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    context.read<CartCubit>().decreaseQuantity(
                                      item.product,
                                    );
                                  },
                                ),

                                Text(item.quantity.toString()),

                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    context.read<CartCubit>().increaseQuantity(
                                      item.product,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),

                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            final confirm = await showDialog<bool>(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text("Eliminar producto"),
                                content: const Text(
                                  "¿Seguro que deseas eliminar este producto del carrito?",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, false),
                                    child: const Text("Cancelar"),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, true),
                                    child: const Text("Eliminar"),
                                  ),
                                ],
                              ),
                            );

                            if (!context.mounted)
                              return; //elimina el mensaje:  Don't use 'BuildContext's across async gaps. Try rewriting the code to not use the 'BuildContext', or guard the use with a 'mounted'
                            if (confirm == true) {
                              context.read<CartCubit>().removeProduct(
                                item.product,
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "${item.product.title} eliminado",
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      "Total: \$${total.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CheckoutPage(),
                            ),
                          );
                        },
                        child: const Text("Finalizar compra"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

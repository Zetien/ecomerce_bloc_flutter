import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_z_comerce/features/cart/presentation/bloc/cubit/cart_cubit.dart';
import 'package:smart_z_comerce/features/cart/presentation/pages/cart_page.dart';
import 'package:smart_z_comerce/features/products/presentation/pages/product_detail_page.dart';
import '../bloc/product_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Z eCommerce'),
        actions: [
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              final count = state.items.fold<int>(
                0,
                (sum, item) => sum + item.quantity,
              );

              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CartPage()),
                      );
                    },
                  ),

                  if (count > 0)
                    Positioned(
                      right: 6,
                      top: 6,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Text(
                          count.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),

      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (_, index) {
                final product = state.products[index];

                return Card(
                  child: ListTile(
                    leading: Image.network(product.image, width: 50),
                    title: Text(product.title),
                    subtitle: Text('\$${product.price}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailPage(product: product),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }

          if (state is ProductError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox();
        },
      ),
    );
  }
}

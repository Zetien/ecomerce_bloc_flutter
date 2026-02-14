import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_z_comerce/features/cart/presentation/bloc/cubit/cart_cubit.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final cardController = TextEditingController();

  String paymentMethod = "card";

  @override
  Widget build(BuildContext context) {
    final cartState = context.watch<CartCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            /// 📦 DIRECCIÓN
            const Text(
              "Dirección de envío",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Nombre completo",
              ),
              validator: (value) =>
                  value!.isEmpty ? "Campo requerido" : null,
            ),

            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: "Dirección",
              ),
              validator: (value) =>
                  value!.isEmpty ? "Campo requerido" : null,
            ),

            TextFormField(
              controller: cityController,
              decoration: const InputDecoration(
                labelText: "Ciudad",
              ),
              validator: (value) =>
                  value!.isEmpty ? "Campo requerido" : null,
            ),

            const SizedBox(height: 25),

            /// 💳 MÉTODO DE PAGO
            const Text(
              "Método de pago",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            RadioListTile(
              value: "card",
              groupValue: paymentMethod,
              onChanged: (value) {
                setState(() {
                  paymentMethod = value!;
                });
              },
              title: const Text("Tarjeta de crédito"),
            ),

            RadioListTile(
              value: "cash",
              groupValue: paymentMethod,
              onChanged: (value) {
                setState(() {
                  paymentMethod = value!;
                });
              },
              title: const Text("Pago contra entrega"),
            ),

            if (paymentMethod == "card")
              TextFormField(
                controller: cardController,
                decoration: const InputDecoration(
                  labelText: "Número de tarjeta",
                ),
                validator: (value) {
                  if (paymentMethod == "card" && value!.isEmpty) {
                    return "Ingrese la tarjeta";
                  }
                  return null;
                },
              ),

            const SizedBox(height: 25),

            /// 🧾 RESUMEN DEL PEDIDO
            const Text(
              "Resumen del pedido",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            ...cartState.items.map((item) {
              return ListTile(
                title: Text(item.product.title),
                subtitle:
                    Text("${item.quantity} x \$${item.product.price}"),
                trailing: Text(
                  "\$${item.total.toStringAsFixed(2)}",
                ),
              );
            }),

            const Divider(),

            Text(
              "Total: \$${cartState.total.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            /// 🚀 BOTÓN FINAL
            ElevatedButton(
              onPressed: () async {
                if (!_formKey.currentState!.validate()) return;

                /// Simulación de pago
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) =>
                      const Center(child: CircularProgressIndicator()),
                );

                await Future.delayed(
                  const Duration(seconds: 2),
                );

                if (!context.mounted) return;

                Navigator.pop(context); // cerrar loading

                context.read<CartCubit>().clearCart();

                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Pedido realizado 🎉"),
                    content: const Text(
                      "Tu compra ha sido procesada con éxito.",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text("Aceptar"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Realizar pedido"),
            ),
          ],
        ),
      ),
    );
  }
}

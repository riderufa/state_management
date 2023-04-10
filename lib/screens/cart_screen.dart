import 'package:flutter/material.dart';
import 'package:module_business/module_business.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<CartController>(
        builder: (context, state, child) => ListView(
          children: state.cart.products
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        e.title,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () => context
                            .read<CartController>()
                            .removeProductFromCart(e),
                        child: const Text('Remove from cart'),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

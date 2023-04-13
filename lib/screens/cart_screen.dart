import 'package:flutter/material.dart';
import 'package:module_data/module_data.dart';

class CartPage extends StatelessWidget {
  CartPage({
    super.key,
    this.products,
    required this.removeProductFromCart,
  });

  List<ProductData>? products;
  final Function(ProductData) removeProductFromCart;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: products
                ?.map(
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
                          onPressed: () => removeProductFromCart(e),
                          child: const Text('Remove from cart'),
                        ),
                      ],
                    ),
                  ),
                )
                .toList() ??
            [],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:module_data/module_data.dart';

class ProductList extends StatelessWidget {
  final List<ProductData>? products;
  final Function(ProductData) addProductToCart;

  const ProductList({
    super.key,
    required this.products,
    required this.addProductToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: products
                ?.map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            e.title,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () => addProductToCart(e),
                            child: const Text('Add to cart'),
                          ),
                        ],
                      ),
                    ))
                .toList() ??
            [],
      ),
    );
  }
}

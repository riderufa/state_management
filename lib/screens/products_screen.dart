import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:module_business/module_business.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CartState>(context);

    return Observer(
      builder: (context) => Center(
        child: ListView(
          children: state.products
              .map((e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          e.title,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () => state.addProductToCart(e),
                          child: const Text('Add to cart'),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

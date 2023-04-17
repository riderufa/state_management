import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_business/module_business.dart';
import 'package:module_data/module_data.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, AppState>(
      builder: (_, state) => Center(
        child: ListView(
          children: state.cartProducts
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
                            .read<CartBloc>()
                            .add(RemoveProductCartEvent(e)),
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

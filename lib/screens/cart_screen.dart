import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:module_business/module_business.dart';
import 'package:module_data/module_data.dart';
import 'package:redux/redux.dart';

class CartConnector extends StatelessWidget {
  const CartConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return CartPage(
          cartProducts: vm.cartProducts,
          removeProductFromCart: vm.removeProductFromCart,
        );
      },
    );
  }
}

class _ViewModel {
  final List<ProductData> cartProducts;
  final Function(ProductData) removeProductFromCart;

  _ViewModel({
    required this.cartProducts,
    required this.removeProductFromCart,
  });

  factory _ViewModel.fromStore(Store<AppState> store) {
    return _ViewModel(
      cartProducts: store.state.cartProducts,
      removeProductFromCart: (p) => store.dispatch(RemoveProductCartAction(p)),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          cartProducts == other.cartProducts;

  @override
  int get hashCode => cartProducts.hashCode;
}

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
    required this.cartProducts,
    required this.removeProductFromCart,
  });

  final List<ProductData> cartProducts;
  final Function(ProductData) removeProductFromCart;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: cartProducts
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
                      onPressed: () => removeProductFromCart(e),
                      child: const Text('Remove from cart'),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

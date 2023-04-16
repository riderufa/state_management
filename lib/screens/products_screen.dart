import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:module_business/module_business.dart';
import 'package:module_data/module_data.dart';
import 'package:redux/redux.dart';

class ProductsConnector extends StatelessWidget {
  const ProductsConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return ProductList(
          products: vm.products,
          addProductToCart: vm.addProductToCart,
        );
      },
    );
  }
}

class _ViewModel {
  final List<ProductData> products;
  final Function(ProductData) addProductToCart;

  _ViewModel({
    required this.products,
    required this.addProductToCart,
  });

  factory _ViewModel.fromStore(Store<AppState> store) {
    return _ViewModel(
      products: store.state.products,
      addProductToCart: (p) => store.dispatch(AddProductCartAction(p)),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel && runtimeType == other.runtimeType && products == other.products;

  @override
  int get hashCode => products.hashCode;
}

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.products,
    required this.addProductToCart,
  });

  final List<ProductData> products;
  final Function(ProductData) addProductToCart;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(
          children: products
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
                          onPressed: () => addProductToCart(e),
                          child: const Text('Add to cart'),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
      );
  }
}

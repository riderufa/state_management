import 'package:flutter/material.dart';

import 'package:module_data/module_data.dart';

class CartController with ChangeNotifier {
  CartData? cart;
  List<Product>? products;

  final ProductManagerInterface _productManager;
  final CartManagerInterface _cartManager;

  CartController({
    required ProductManagerInterface productManager,
    required CartManagerInterface cartManager,
  })  : _productManager = productManager,
        _cartManager = cartManager;

  Future<void> getCart() async {
    cart = await _cartManager.fetchOne();
    notifyListeners();
  }

  void addProductToCart(Product product) async {
    cart = await _productManager.addProductToCart(product, cart!);
    notifyListeners();
  }

  void removeProductFromCart(Product product) async {
    cart = await _productManager.removeProductFromCart(product, cart!);
    notifyListeners();
  }

  void getProducts() async {
    products = await _productManager.fetchAll();
    notifyListeners();
  }
}

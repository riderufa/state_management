import 'package:flutter/material.dart';

import 'package:module_data/module_data.dart';

class CartController with ChangeNotifier {
  late CartData cart;
  late List<ProductData> products = [];

  final ProductRepositoryInterface _productRepository;
  final CartRepositoryInterface _cartRepository;

  bool get isLoaded => products.isNotEmpty;

  CartController(this._cartRepository, this._productRepository) {
    _initProducts();
    _initCart();
  }

  Future<void> _initCart() async {
    cart = await _cartRepository.fetchOne();
    notifyListeners();
  }

  void addProductToCart(ProductData product) async {
    cart = await _productRepository.addProductToCart(product, cart);
    notifyListeners();
  }

  void removeProductFromCart(ProductData product) async {
    cart = await _productRepository.removeProductFromCart(product, cart);
    notifyListeners();
  }

  void _initProducts() async {
    products = await _productRepository.fetchAll();
    notifyListeners();
  }
}

import 'dart:async';

import 'package:module_data/module_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CartBloc extends Cubit<AppState> {
  final ProductRepository _productRepository;

  CartBloc(this._productRepository) : super(const AppState());

  Future<void> getProducts() async {
    final products = await _productRepository.fetchAll();
    emit(state.copyWith(products: products));
  }

  Future<void> addProductToCart(ProductData product) async {
    final products = await _productRepository.addProductToCart(state.cartProducts, product);
    emit(state.copyWith(cartProducts: products));
  }

  Stream<AppState> removeProductFromCart(ProductData product) async* {
    final products = await _productRepository.removeProductFromCart(state.cartProducts, product);
    yield state.copyWith(cartProducts: products);
  }
}

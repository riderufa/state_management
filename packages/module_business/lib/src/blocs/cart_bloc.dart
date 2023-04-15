import 'dart:async';

import 'package:module_business/src/actions/cart_actions.dart';
import 'package:module_data/module_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CartBloc extends Bloc<Action, AppState> {
  final ProductRepository _productRepository;

  CartBloc(this._productRepository) : super(const AppState());

  @override
  Stream<AppState> mapEventToState(Action action) async* {
    if (action is GetProductsAction) {
      try {
        final products = await _productRepository.fetchAll();
        yield state.copyWith(products: products);
      } on Exception {
        yield state.copyWith(products: []);
      }
    } else if (action is AddProductCartAction) {
      try {
        final products = await _productRepository.addProductToCart(state.cartProducts, action.product);
        yield state.copyWith(cartProducts: products);
      } on Exception {
        yield state.copyWith(products: state.products);
      }
    } else if (action is RemoveProductCartAction) {
      try {
        final products = await _productRepository.removeProductFromCart(state.cartProducts, action.product);
        yield state.copyWith(cartProducts: products);
      } on Exception {
        yield state.copyWith(products: state.products);
      }
    }
  }
}

import 'dart:async';

import 'package:module_business/src/actions/cart_actions.dart';
import 'package:module_data/module_data.dart';

class CartBloc {
  final ProductRepository _productRepository;

  var _currentState = const AppState();

  final _stateController = StreamController<AppState>();
  final _actionsController = StreamController<Action>();

  Stream<AppState> get state => _stateController.stream;
  Sink<Action> get action => _actionsController.sink;

  CartBloc(this._productRepository) {
    _actionsController.stream.listen(_handleAction);
  }

  void dispose() {
    _stateController.close();
    _actionsController.close();
  }

  Future<void> _handleAction(Action action) async {
    if (action is GetProductsAction) {
      try {
        final products = await _productRepository.fetchAll();
        _currentState = _currentState.copyWith(products: products);
      } on Exception {
        _currentState = _currentState.copyWith(products: []);
      }
    }
    if (action is AddProductCartAction) {
      try {
        final products = await _productRepository.addProductToCart(
            _currentState.cartProducts, action.product);
        _currentState = _currentState.copyWith(cartProducts: products);
      } on Exception {
        _currentState = _currentState.copyWith(cartProducts: []);
      }
    }
    if (action is RemoveProductCartAction) {
      try {
        final products = await _productRepository.removeProductFromCart(
            _currentState.cartProducts, action.product);
        _currentState = _currentState.copyWith(cartProducts: products);
      } on Exception {
        _currentState = _currentState.copyWith(cartProducts: []);
      }
    }
    _stateController.add(_currentState);
  }
}

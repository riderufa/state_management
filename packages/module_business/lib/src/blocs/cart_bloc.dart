import 'dart:async';

import 'package:module_business/src/events/cart_events.dart';
import 'package:module_data/module_data.dart';

class CartBloc {
  final ProductRepository _productRepository;

  var _currentState = const AppState();

  final _stateController = StreamController<AppState>();
  final _actionsController = StreamController<Event>();

  Stream<AppState> get state => _stateController.stream;
  Sink<Event> get action => _actionsController.sink;

  CartBloc(this._productRepository) {
    _actionsController.stream.listen(_handleAction);
  }

  void dispose() {
    _stateController.close();
    _actionsController.close();
  }

  Future<void> _handleAction(Event action) async {
    if (action is GetProductsEvent) {
      try {
        final products = await _productRepository.fetchAll();
        _currentState = _currentState.copyWith(products: products);
      } on Exception {
        _currentState = _currentState.copyWith(products: []);
      }
    }
    if (action is AddProductCartEvent) {
      try {
        final products = await _productRepository.addProductToCart(
            _currentState.cartProducts, action.product);
        _currentState = _currentState.copyWith(cartProducts: products);
      } on Exception {
        _currentState = _currentState.copyWith(cartProducts: []);
      }
    }
    if (action is RemoveProductCartEvent) {
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

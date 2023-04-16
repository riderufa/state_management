import 'package:mobx/mobx.dart';
import 'package:module_data/module_data.dart';

part 'cart_observable.g.dart';

class CartState = _CartState with _$CartState;

abstract class _CartState with Store {
  final ProductRepository _productRepository;
  final CartRepository _cartRepository;

  @observable
  List<ProductData> products = [];

  @observable
  List<ProductData> cartProducts = [];

  _CartState(this._productRepository, this._cartRepository) {
    _initProducts();
  }

  @action
  Future<void> _initProducts() async {
    products = await _productRepository.fetchAll();
  }

  @action
  Future<void> addProductToCart(ProductData product) async {
    cartProducts = await _productRepository.addProductToCart(cartProducts, product);
  }

  @action
  Future<void> removeProductFromCart(ProductData product) async {
    cartProducts = await _productRepository.removeProductFromCart(cartProducts, product);
  }
}

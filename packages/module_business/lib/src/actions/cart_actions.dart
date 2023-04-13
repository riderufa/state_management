import 'package:module_data/module_data.dart';

abstract class Action {}

abstract class CartAction extends Action {}

class AddProductCartAction extends CartAction {
  final List<ProductData> cartProducts;
  final ProductData product;

  AddProductCartAction(this.cartProducts, this.product);
}

class RemoveProductCartAction extends CartAction {
  final List<ProductData> cartProducts;
  final ProductData product;

  RemoveProductCartAction(this.cartProducts, this.product);
}

class GetProductsAction extends CartAction {}

class GetCartAction extends CartAction {}

import 'package:module_data/module_data.dart';

abstract class Action {}

abstract class CartAction extends Action {}

class AddProductCartAction extends CartAction {
  final ProductData product;

  AddProductCartAction(this.product);
}

class RemoveProductCartAction extends CartAction {
  final ProductData product;

  RemoveProductCartAction(this.product);
}

class GetProductsAction extends CartAction {}

class GetCartAction extends CartAction {}

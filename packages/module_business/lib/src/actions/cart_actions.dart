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

class ProductsNotLoadedAction {}

class ProductsLoadedAction {
  final List<ProductData> products;

  ProductsLoadedAction(this.products);
}

class GetCartProductsAction extends CartAction {}

class CartNotUpdatedAction {}

class CartUpdatedAction {
  final List<ProductData> cartProducts;

  CartUpdatedAction(this.cartProducts);
}

class GetCartAction extends CartAction {}

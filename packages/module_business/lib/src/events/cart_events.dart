import 'package:module_data/module_data.dart';

abstract class Event {}

abstract class CartEvent extends Event {}

class AddProductCartEvent extends CartEvent {
  final ProductData product;

  AddProductCartEvent(this.product);
}

class RemoveProductCartEvent extends CartEvent {
  final ProductData product;

  RemoveProductCartEvent(this.product);
}

class GetProductsEvent extends CartEvent {}

class ProductsNotLoadedEvent {}

class ProductsLoadedEvent {
  final List<ProductData> products;

  ProductsLoadedEvent(this.products);
}

class GetCartProductsEvent extends CartEvent {}

class CartNotUpdatedEvent {}

class CartUpdatedEvent {
  final List<ProductData> cartProducts;

  CartUpdatedEvent(this.cartProducts);
}

class GetCartEvent extends CartEvent {}

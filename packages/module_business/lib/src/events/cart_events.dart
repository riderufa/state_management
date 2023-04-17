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

class GetCartEvent extends CartEvent {}

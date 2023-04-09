import '../models/cart.dart';

CartData _cart = const CartData(0, 'First cart title', []);

abstract class CartManagerInterface {
  Future<CartData> fetchOne();
}

class CartManager implements CartManagerInterface {
  @override
  Future<CartData> fetchOne() async {
    await Future.delayed(const Duration(seconds: 2));
    return _cart;
  }
}

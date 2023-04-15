import '../models/cart.dart';

CartData _cart = const CartData(id: 0, title: 'First cart title', products: []);

abstract class CartRepositoryInterface {
  Future<CartData> fetchOne();
}

class CartRepository implements CartRepositoryInterface {
  @override
  Future<CartData> fetchOne() async {
    await Future.delayed(const Duration(seconds: 2));
    return _cart;
  }
}

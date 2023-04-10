import '../models/product.dart';
import '../models/cart.dart';

List<Product> _products = const [
  Product(0, 'First product title'),
  Product(1, 'Second product title'),
  Product(2, 'Third product title'),
  Product(3, 'Fourth product title'),
  Product(4, 'Fifth product title'),
  Product(5, 'Sixth product title'),
  Product(6, 'Seventh product title'),
  Product(7, 'Eighth product title'),
  Product(8, 'Ninth product title'),
  Product(9, 'Tenth product title'),
  Product(10, 'Eleventh product title'),
];

abstract class ProductRepositoryInterface {
  Future<List<Product>> fetchAll();
  Future<Product> fetchOne(int productId);
  Future<CartData> addProductToCart(Product product, CartData cart);
  Future<CartData> removeProductFromCart(Product product, CartData cart);
}

class ProductRepository implements ProductRepositoryInterface {
  @override
  Future<CartData> addProductToCart(Product product, CartData cart) async {
    await Future.delayed(const Duration(seconds: 1));
    return CartData(cart.id, cart.title, [...cart.products, product]);
  }

  @override
  Future<List<Product>> fetchAll() async {
    await Future.delayed(const Duration(seconds: 2));
    return _products;
  }

  @override
  Future<Product> fetchOne(int productId) async {
    await Future.delayed(const Duration(seconds: 2));
    return _products[productId];
  }

  @override
  Future<CartData> removeProductFromCart(Product product, CartData cart) async {
    await Future.delayed(const Duration(seconds: 1));
    cart.products.remove(product);
    return cart;
  }
}

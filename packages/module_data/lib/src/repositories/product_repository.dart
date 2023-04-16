import '../models/product.dart';
import '../models/cart.dart';

List<ProductData> _products = const [
  ProductData(id: 0, title: 'First product title'),
  ProductData(id: 1, title: 'Second product title'),
  ProductData(id: 2, title: 'Third product title'),
  ProductData(id: 3, title: 'Fourth product title'),
  ProductData(id: 4, title: 'Fifth product title'),
  ProductData(id: 5, title: 'Sixth product title'),
  ProductData(id: 6, title: 'Seventh product title'),
  ProductData(id: 7, title: 'Eighth product title'),
  ProductData(id: 8, title: 'Ninth product title'),
  ProductData(id: 9, title: 'Tenth product title'),
  ProductData(id: 10, title: 'Eleventh product title'),
];

abstract class ProductRepositoryInterface {
  const ProductRepositoryInterface();

  Future<List<ProductData>> fetchAll();
  Future<ProductData> fetchOne(int productId);
  Future<List<ProductData>> addProductToCart(List<ProductData> cartProducts, ProductData product);
  Future<List<ProductData>> removeProductFromCart(List<ProductData> cartProducts, ProductData product);
}

class ProductRepository implements ProductRepositoryInterface {
  const ProductRepository();

  @override
  Future<List<ProductData>> addProductToCart(List<ProductData> cartProducts, ProductData product) async {
    await Future.delayed(const Duration(seconds: 1));
    return [...cartProducts, product];
  }

  @override
  Future<List<ProductData>> fetchAll() async {
    await Future.delayed(const Duration(seconds: 2));
    return _products;
  }

  @override
  Future<ProductData> fetchOne(int productId) async {
    await Future.delayed(const Duration(seconds: 2));
    return _products[productId];
  }

  @override
  Future<List<ProductData>> removeProductFromCart(List<ProductData> cartProducts, ProductData product) async {
    await Future.delayed(const Duration(seconds: 1));
    List<ProductData> newProducts = cartProducts;
    newProducts.remove(product);
    return cartProducts;
  }
}

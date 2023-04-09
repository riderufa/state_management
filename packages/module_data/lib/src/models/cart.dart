import 'product.dart';

class CartData {
  final int id;
  final String title;
  final List<Product> products;

  const CartData(this.id, this.title, this.products);
}

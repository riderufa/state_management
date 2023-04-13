import 'package:module_data/src/models/product.dart';

class AppState {
  final List<ProductData> products;
  final List<ProductData> cartProducts;

  const AppState({
    this.products = const [],
    this.cartProducts = const [],
  });

  AppState copyWith({
    List<ProductData>? products,
    List<ProductData>? cartProducts,
  }) {
    return AppState(
      products: products ?? this.products,
      cartProducts: cartProducts ?? this.cartProducts,
    );
  }
}

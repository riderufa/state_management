import 'package:module_data/src/models/product.dart';

class AppState {
  final bool isLoading;
  final List<ProductData> products;
  final List<ProductData> cartProducts;

  const AppState({
    this.isLoading = false,
    this.products = const [],
    this.cartProducts = const [],
  });

  factory AppState.loading() => const AppState(isLoading: true);

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

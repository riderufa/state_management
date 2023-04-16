import 'package:module_business/src/reducers/cart_products_reducer.dart';
import 'package:module_business/src/reducers/products_reducer.dart';
import 'package:module_data/module_data.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    products: productsReducer(state.products, action),
    cartProducts: cartProductsReducer(state.cartProducts, action),
  );
}

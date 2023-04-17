import 'package:module_business/module_business.dart';
import 'package:module_data/module_data.dart';
import 'package:redux/redux.dart';

final cartProductsReducer = combineReducers<List<ProductData>>([
  TypedReducer<List<ProductData>, GetCartProductsEvent>(_getCartProducts),
  TypedReducer<List<ProductData>, CartUpdatedEvent>(_setLoadedProducts),
  TypedReducer<List<ProductData>, CartNotUpdatedEvent>(_setNoProducts),
  // TypedReducer<List<ProductData>, AddProductCartAction>(_addProductToCart),
  // TypedReducer<List<ProductData>, RemoveProductCartAction>(_removeProductFromCart),
]);

List<ProductData> _getCartProducts(List<ProductData> products, GetCartProductsEvent action) {
  return products;
}

// List<ProductData> _addProductToCart(List<ProductData> products, AddProductCartAction action) {
//   return products;
// }

// List<ProductData> _removeProductFromCart(List<ProductData> products, RemoveProductCartAction action) {
//   return products;
// }

List<ProductData> _setLoadedProducts(List<ProductData> products, CartUpdatedEvent action) {
  return action.cartProducts;
}

List<ProductData> _setNoProducts(List<ProductData> products, CartNotUpdatedEvent action) {
  return products;
}

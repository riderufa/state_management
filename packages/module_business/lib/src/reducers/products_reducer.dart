import 'package:module_business/module_business.dart';
import 'package:module_data/module_data.dart';
import 'package:redux/redux.dart';

final productsReducer = combineReducers<List<ProductData>>([
  TypedReducer<List<ProductData>, GetProductsEvent>(_getProducts),
  TypedReducer<List<ProductData>, ProductsLoadedEvent>(_setLoadedProducts),
  TypedReducer<List<ProductData>, ProductsNotLoadedEvent>(_setNoProducts),
]);

List<ProductData> _getProducts(List<ProductData> products, GetProductsEvent action) {
  return products;
}

List<ProductData> _setLoadedProducts(List<ProductData> products, ProductsLoadedEvent action) {
  return action.products;
}

List<ProductData> _setNoProducts(List<ProductData> products, ProductsNotLoadedEvent action) {
  return [];
}

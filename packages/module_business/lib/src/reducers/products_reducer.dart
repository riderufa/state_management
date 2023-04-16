import 'package:module_business/module_business.dart';
import 'package:module_data/module_data.dart';
import 'package:redux/redux.dart';

final productsReducer = combineReducers<List<ProductData>>([
  TypedReducer<List<ProductData>, GetProductsAction>(_getProducts),
  TypedReducer<List<ProductData>, ProductsLoadedAction>(_setLoadedProducts),
  TypedReducer<List<ProductData>, ProductsNotLoadedAction>(_setNoProducts),
]);

List<ProductData> _getProducts(List<ProductData> products, GetProductsAction action) {
  return products;
}

List<ProductData> _setLoadedProducts(List<ProductData> products, ProductsLoadedAction action) {
  return action.products;
}

List<ProductData> _setNoProducts(List<ProductData> products, ProductsNotLoadedAction action) {
  return [];
}

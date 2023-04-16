import 'package:module_business/module_business.dart';
import 'package:module_data/module_data.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStoreMiddleware(
    [ProductRepositoryInterface productRepo = const ProductRepository(),
    CartRepositoryInterface cartRepo = const CartRepository()]) {
  final getProducts = _createGetProducts(productRepo);
  final addProduct = _createAddProductToCart(productRepo);
  final removeProduct = _createRemoveProductFromCart(productRepo);

  return [
    TypedMiddleware<AppState, GetProductsAction>(getProducts),
    TypedMiddleware<AppState, AddProductCartAction>(addProduct),
    TypedMiddleware<AppState, RemoveProductCartAction>(removeProduct),
  ];
}

Middleware<AppState> _createAddProductToCart(ProductRepositoryInterface repository) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    await repository
        .addProductToCart(store.state.cartProducts, action.product)
        .then((products) => store.dispatch(
              CartUpdatedAction(
                products,
              ),
            ))
        .catchError((_) => store.dispatch(CartNotUpdatedAction()));
    next(action);
  };
}

Middleware<AppState> _createRemoveProductFromCart(ProductRepositoryInterface repository) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    await repository
        .removeProductFromCart(store.state.cartProducts, action.product)
        .then((products) => store.dispatch(
              CartUpdatedAction(
                products,
              ),
            ))
        .catchError((_) => store.dispatch(CartNotUpdatedAction()));
    next(action);
  };
}

Middleware<AppState> _createGetProducts(ProductRepositoryInterface repository) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    await repository
        .fetchAll()
        .then((products) => store.dispatch(
              ProductsLoadedAction(
                products,
              ),
            ))
        .catchError((_) => store.dispatch(ProductsNotLoadedAction()));

    next(action);
  };
}

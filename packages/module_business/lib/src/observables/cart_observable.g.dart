// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_observable.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartState on _CartState, Store {
  late final _$productsAtom =
      Atom(name: '_CartState.products', context: context);

  @override
  List<ProductData> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<ProductData> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$cartProductsAtom =
      Atom(name: '_CartState.cartProducts', context: context);

  @override
  List<ProductData> get cartProducts {
    _$cartProductsAtom.reportRead();
    return super.cartProducts;
  }

  @override
  set cartProducts(List<ProductData> value) {
    _$cartProductsAtom.reportWrite(value, super.cartProducts, () {
      super.cartProducts = value;
    });
  }

  late final _$_initProductsAsyncAction =
      AsyncAction('_CartState._initProducts', context: context);

  @override
  Future<void> _initProducts() {
    return _$_initProductsAsyncAction.run(() => super._initProducts());
  }

  late final _$addProductToCartAsyncAction =
      AsyncAction('_CartState.addProductToCart', context: context);

  @override
  Future<void> addProductToCart(ProductData product) {
    return _$addProductToCartAsyncAction
        .run(() => super.addProductToCart(product));
  }

  late final _$removeProductFromCartAsyncAction =
      AsyncAction('_CartState.removeProductFromCart', context: context);

  @override
  Future<void> removeProductFromCart(ProductData product) {
    return _$removeProductFromCartAsyncAction
        .run(() => super.removeProductFromCart(product));
  }

  @override
  String toString() {
    return '''
products: ${products},
cartProducts: ${cartProducts}
    ''';
  }
}

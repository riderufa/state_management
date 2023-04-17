import 'package:module_business/src/events/cart_events.dart';
import 'package:module_data/module_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<Event, AppState> {
  final ProductRepository _productRepository;

  CartBloc(this._productRepository) : super(const AppState()) {
    on<GetProductsEvent>((event, emit) async {
      final products = await _productRepository.fetchAll();
      return emit(state.copyWith(products: products));
    });
    on<AddProductCartEvent>((event, emit) async {
      final products = await _productRepository.addProductToCart(state.cartProducts, event.product);
      return emit(state.copyWith(cartProducts: products));
    });
    on<RemoveProductCartEvent>((event, emit) async {
      final products = await _productRepository.removeProductFromCart(state.cartProducts, event.product);
      return emit(state.copyWith(cartProducts: products));
    });
  }
}

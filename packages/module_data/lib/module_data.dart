export 'src/models/product.dart';
export 'src/models/cart.dart';
export 'src/managers/product_manager.dart';
export 'src/managers/cart_manager.dart';

import '';

final locator = <Type, dynamic>{
  ProductManagerInterface : ProductManager(),
  CartManagerInterface : CartManager(),
};

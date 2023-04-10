import 'package:flutter/material.dart';

import 'product.dart';

@immutable
class CartData {
  final int id;
  final String title;
  final List<ProductData> products;

  const CartData({required this.id, required this.title, required this.products});

  CartData copyWith({int? id, String? title, List<ProductData>? products}) {
    return CartData(
      id: id ?? this.id,
      title: title ?? this.title,
      products: products ?? this.products,
    );
  }
}

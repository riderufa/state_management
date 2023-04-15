import 'package:flutter/material.dart';

@immutable
class ProductData {
  final int id;
  final String title;

  const ProductData({required this.id, required this.title});

  ProductData copyWith({int? id, String? title}) {
    return ProductData(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }
}

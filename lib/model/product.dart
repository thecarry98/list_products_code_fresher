import 'package:flutter/material.dart';

List<Product> list = [];

class Product {
  final String linkImage;
  final String title;
  final double price;
  final String description;
  Product(
      {required this.title,
      required this.linkImage,
      required this.price,
      required this.description});

  Product copy({
    String? linkImage,
    String? title,
    double? price,
    String? description,
  }) =>
      Product(
        linkImage: linkImage ?? this.linkImage,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
      );
  getLink() {
    return this.linkImage;
  }

  getTitle() {
    return this.title;
  }
}

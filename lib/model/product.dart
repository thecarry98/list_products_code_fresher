import 'package:flutter/material.dart';

List<Product> list = [];
Map<Product, int> mapProduct = {};

final String tableNotes = 'products';

class ProductFields {
  static final List<String> values = [
    /// Add all fields
    id, linkImage, title, price, description
  ];

  static final String id = '_id';
  static final String linkImage = 'linkImage';
  static final String title = 'title';
  static final String price = 'price';
  static final String description = 'description';
}

class Product {
  final int? id;
  final String linkImage;
  final String title;
  final double price;
  final String description;
  Product(
      {this.id,
      required this.title,
      required this.linkImage,
      required this.price,
      required this.description});

  Product copy({
    int? id,
    String? linkImage,
    String? title,
    double? price,
    String? description,
  }) =>
      Product(
        id: id ?? this.id,
        linkImage: linkImage ?? this.linkImage,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
      );

  static Product fromJson(Map<String, Object?> json) => Product(
        id: json[ProductFields.id] as int?,
        linkImage: json[ProductFields.linkImage] as String,
        title: json[ProductFields.title] as String,
        price: json[ProductFields.price] as double,
        description: json[ProductFields.description] as String,
      );

  Map<String, Object?> toJson() => {
        ProductFields.id: id,
        ProductFields.linkImage: linkImage,
        ProductFields.title: title,
        ProductFields.price: price,
        ProductFields.description: description,
      };
}

class Cart {
  final Product product;
  int amount = 0;
  Cart({required this.product});

  addAmount() {
    amount += 1;
  }

  subAmout() {
    amount -= 1;
  }
}

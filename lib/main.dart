import 'package:flutter/material.dart';
import 'package:list_products_code_fresher/pages/edit_page.dart';
import 'package:list_products_code_fresher/pages/home_page.dart';
import 'package:list_products_code_fresher/pages/edit_page.dart';
import 'package:list_products_code_fresher/model/product.dart';
import 'package:list_products_code_fresher/control/control.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // product pro1() => product(
  //     title: 'product 1',
  //     linkimage:
  //         'https://1.bigdata-vn.com/wp-content/uploads/2021/12/Hinh-Nen-Girl-Xinh-Full-HD-Cho-Laptop-Va-May.jpg');

  Control control() => Control();
  // MyApp.addList(pro1())

  Widget build(BuildContext context) {
    // List<Product> list = [];
    return MaterialApp(
      title: 'List Products',
      home: HomePages(),
    );
  }
}

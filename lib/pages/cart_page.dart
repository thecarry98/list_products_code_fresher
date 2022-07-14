import 'package:flutter/material.dart';
import 'package:list_products_code_fresher/Widget/title_app_bar.dart';
import 'package:list_products_code_fresher/model/product.dart';
import 'package:list_products_code_fresher/Widget/cart_product_widget.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  titleAppBar _title() => titleAppBar(title: 'Your Cart');

  void _setState() {
    setState(() {
      // mapProduct.remove(list[index]);
      // if (mapProduct)[list[index]] > 0) ;
      // print(mapProduct[list[index]]);
    });
  }

  Widget _listViewCart() {
    return ListView.builder(
      itemCount: mapProduct.length,
      itemBuilder: (context, index) => Container(
        child:
            // mapProduct[list[index]] > 0 ?
            CartProductWidget(index: index, callChangeAmount: _setState),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: _listViewCart(),
    );
  }
}

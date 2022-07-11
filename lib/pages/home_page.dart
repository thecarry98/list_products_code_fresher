import 'package:flutter/material.dart';
import 'package:list_products_code_fresher/Widget/title_app_bar.dart';
import 'package:list_products_code_fresher/model/product.dart';
import 'package:list_products_code_fresher/Widget/products_widget.dart';
import 'package:list_products_code_fresher/pages/edit_page.dart';
import 'package:list_products_code_fresher/control/control.dart';

class HomePages extends StatefulWidget {
  const HomePages({
    super.key,
  });
  // final Product product;
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  // _HomePagesState({required this.list});
  titleAppBar _title() => titleAppBar(title: 'Your products');

  // final List<Product> list = [];
  // Product product()=>Product
  void initState() {
    super.initState();

    Product pro1() => Product(
        title: 'Product 1',
        linkImage:
            'https://1.bigdata-vn.com/wp-content/uploads/2021/12/Hinh-Nen-Girl-Xinh-Full-HD-Cho-Laptop-Va-May.jpg',
        price: 0.0,
        description: 'haah');
    list.add(pro1());
  }

  removeList(int index) {
    setState(() {
      list.remove(list[index]);
    });
  }

  Widget addAction() {
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditPage(),
          ),
        );
      },
    );
  }

  Widget listView() => ListView.builder(itemBuilder: (context, index) {
        Product product = list[index];

        return Container(
          child: productWidget(product: list[index], index: index),
        );
      });

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
        centerTitle: true,
        actions: [addAction()],
      ),
      body: listView(),
      // children: [productWidget(product: pro1())],
    );
  }
}

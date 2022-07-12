import 'package:flutter/material.dart';
import 'package:list_products_code_fresher/Widget/title_app_bar.dart';
import 'package:list_products_code_fresher/model/product.dart';
import 'package:list_products_code_fresher/Widget/products_widget.dart';
import 'package:list_products_code_fresher/pages/edit_page.dart';
import 'package:list_products_code_fresher/control/control.dart';

class HomePages extends StatefulWidget {
  HomePages({
    super.key,
    // this.product,
  });
  // Product? product;
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  titleAppBar _title() => titleAppBar(title: 'Your products');

  void initState() {
    super.initState();
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

  Widget listView() => ListView.separated(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
            child: productWidget(
                index: index,
                callbackFn: () {
                  removeList(index);
                  // print(list);
                }),
          );
        },
        separatorBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              height: 0,
              thickness: 1,
              color: Colors.black.withOpacity(0.5),
            ),
          );
        },
      );

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
        centerTitle: true,
        actions: [addAction()],
      ),
      body: listView(),
    );
  }
}

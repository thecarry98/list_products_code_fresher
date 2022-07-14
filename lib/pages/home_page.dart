import 'package:flutter/material.dart';
import 'package:list_products_code_fresher/Widget/title_app_bar.dart';
import 'package:list_products_code_fresher/model/product.dart';
import 'package:list_products_code_fresher/Widget/products_widget.dart';
import 'package:list_products_code_fresher/pages/edit_page.dart';
import 'package:list_products_code_fresher/pages/cart_page.dart';
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
      mapProduct.remove(list[index]);
    });
  }

  addFunction(int index, BuildContext context) {
    // setState(() {});
    mapProduct.containsKey(list[index])
        ? mapProduct.update(list[index], (value) => value + 1)
        : mapProduct[list[index]] = 1;
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Đã thêm vào giỏ hàng',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          ElevatedButton(
            child: Text('Vào giỏ hàng',
                style: TextStyle(
                  fontSize: 15,
                )),
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            }),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          right: 20,
          left: 20),
      backgroundColor: Colors.white,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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

  Widget _drawer() {
    return Drawer(
      elevation: 0.5,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'MENU',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text(
              'Xem giỏ hàng',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              //vào giỏ hàng;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget listView() => ListView.separated(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
            child: productWidget(
              index: index,
              callbackDelFn: () {
                removeList(index);
                // print(list);
              },
              callbackAddFn: () {
                addFunction(index, context);
              },
            ),
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
      drawer: _drawer(),
    );
  }
}

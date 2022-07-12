import 'package:flutter/material.dart';
import 'package:list_products_code_fresher/model/product.dart';
import 'package:list_products_code_fresher/pages/edit_page.dart';
import 'package:list_products_code_fresher/control/control.dart';
import 'package:list_products_code_fresher/pages/home_page.dart';

class productWidget extends StatelessWidget {
  productWidget({super.key, required this.index, this.callbackFn});

  final int index;
  VoidCallback? callbackFn;

  Widget rowProduct(
    String link,
    String title,
    double size,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(size / 2),
          child: Image.network(
            link,
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
        ),
        Flexible(
          child: Text(
            title,
            // maxLines: 1,
            style: TextStyle(fontSize: 25),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget rowIcon(BuildContext context, int index) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IconButton(
        iconSize: 30,
        icon: Icon(
          Icons.edit,
          color: Colors.purple,
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      EditPage(product: list[index], index: index)));
        },
      ),
      IconButton(
        iconSize: 30,
        icon: Icon(
          Icons.call_end,
          color: Colors.green,
        ),
        onPressed: (() {}),
      ),
      IconButton(
        iconSize: 30,
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: callbackFn,
      ),
    ]);
  }

  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Expanded(
          flex: 3,
          child: rowProduct(list[index].linkImage, list[index].title, 50)),
      Expanded(
          flex: 2,
          child: rowIcon(
            context,
            index,
          )),
    ]);
  }
}

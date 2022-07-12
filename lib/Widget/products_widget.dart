import 'package:flutter/material.dart';
import 'package:list_products_code_fresher/model/product.dart';
import 'package:list_products_code_fresher/pages/edit_page.dart';
import 'package:list_products_code_fresher/control/control.dart';

class productWidget extends StatelessWidget {
  const productWidget(
      {super.key, /*required this.product*/ required this.index});

  // final List<Product> list;
  // final Product product;
  final int index;
  // final Control control;

  Widget rowProduct(
    String link,
    String title,
    double size,
  ) {
    return Row(
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
        Text(title),
      ],
    );
  }

  Widget rowIcon(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IconButton(
        icon: Icon(
          Icons.edit,
          color: Colors.purple,
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditPage(product: list[index])));
        },
      ),
      IconButton(
        icon: Icon(
          Icons.call_end,
          color: Colors.green,
        ),
        onPressed: (() {}),
      ),
      IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: (() {
          //setState((){delProduct(i)});
        }),
      ),
    ]);
  }

  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      rowProduct(list[index].linkImage, list[index].title, 30),
      rowIcon(context),
    ]);
  }
}

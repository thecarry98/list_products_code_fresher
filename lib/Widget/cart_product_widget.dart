import 'package:flutter/material.dart';
import 'package:list_products_code_fresher/model/product.dart';

class CartProductWidget extends StatefulWidget {
  CartProductWidget({super.key, required this.index, this.callChangeAmount});
  final int index;
  VoidCallback? callChangeAmount;
  _cartProduct createState() => _cartProduct();
}

class _cartProduct extends State<CartProductWidget> {
  TextEditingController controller = TextEditingController();
  // text: mapProduct[list[widget.index]].toString(),
  // controller = 'haha',

  Widget _titleRow(Product product, double size) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(size / 2),
            child: Image.network(
              product.linkImage,
              width: size,
              height: size,
              fit: BoxFit.cover,
            ),
          ),
          // Spacer(),
          Container(
            width: 100,
            margin: EdgeInsets.only(left: 10),
            child: Text(
              product.title,
              // 'sfsdfsddddddddddddddddddd',
              maxLines: 1,
              style: TextStyle(fontSize: 25),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );

  void addAmount(int index) {
    setState(() {
      mapProduct.update(list[index], (value) => value + 1);
      widget.callChangeAmount;
    });
  }

  void subAmount(int index) {
    setState(() {
      mapProduct.update(list[index], (value) {
        return (value <= 0 ? 0 : value - 1);
      });
      widget.callChangeAmount;
    });
  }

  Widget _amountRow(int index) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              // width: 15,
              child: IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  subAmount(index);
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              // width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.1)),
              ),
              // width: 15,
              child: TextField(
                readOnly: true,
                controller: controller,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                // width: 15,
                child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                addAmount(index);
              },
            )),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    controller.text = mapProduct[list[widget.index]].toString();
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      _titleRow(list[widget.index], 40),
      _amountRow(widget.index),
    ]);
  }
}

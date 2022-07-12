import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/basic_types.dart';

class ProductFormWidget extends StatelessWidget {
  final String? title;
  final double? price;
  final String? description;
  final String? linkImage;
  final ValueChanged<String> titleChanged;
  final ValueChanged<double> priceChanged;
  final ValueChanged<String> descriptionChanged;
  final ValueChanged<String> linkImageChanged;

  const ProductFormWidget({
    Key? key,
    this.title = '',
    this.price = 0,
    this.description = '',
    this.linkImage = '',
    required this.titleChanged,
    required this.priceChanged,
    required this.descriptionChanged,
    required this.linkImageChanged,
  }) : super(key: key);

  void setState() {
    setState();
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text('haha'),
          expanded(),
          // colorContiner(Colors.blue, 'hi', Alignment.center),
          SizedBox(height: 8),
          buildTitle(),
          SizedBox(height: 8),
          buildPrice(),
          SizedBox(height: 8),
          buildDescription(),
          SizedBox(height: 18),
          buildImage(),
        ],
      ),
    );
  }

  Widget expanded() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              // width: 100,
              child: Text(
                'Expanded: ',
              ),
              // height: 50,
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetweenjk,
              children: [
                Expanded(
                  flex: 1,
                  child:
                      colorContainer(Colors.green, '1', Alignment.centerLeft),
                ),
                Expanded(
                  flex: 2,
                  child: colorContainer(Colors.red, '2', Alignment.center),
                ),
                Expanded(
                  flex: 1,
                  child:
                      colorContainer(Colors.blue, '1', Alignment.centerRight),
                ),
              ],
            ),
          ),
        ],
      );

  Widget colorContainer(Color color, String n, Alignment alignment) =>
      Container(
        // width: 50,
        height: 25,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(width: 5, color: color),
            right: BorderSide(width: 5, color: color),
          ),
        ),
        child: Stack(
          // alignment: alignment,
          fit: StackFit.expand,
          children: [
            Container(color: color, height: 50),
            Align(
              alignment: alignment,
              child: Text(n),
            ),
          ],
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
          hintText: 'Title',
        ),
        onChanged: titleChanged,
      );
  Widget buildPrice() => TextFormField(
        maxLines: 1,
        initialValue: price.toString(),
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
          hintText: 'Price',
          hintStyle: TextStyle(
              // fontSize: 20,
              ),
        ),
        onChanged: (number) => priceChanged,
      );

  Widget buildDescription() => TextFormField(
        maxLines: 1,
        initialValue: description,
        // labelText: Text('haah'),
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
          hintText: 'Description',
          // labelText: 'haha',
        ),
        onChanged: descriptionChanged,
      );

  Widget buildImage() => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                width: 100,
                child: Image.network(
                  linkImage!,
                ),
              ),
            ),
            // Spacer(),
            Expanded(
              flex: 3,
              child: TextFormField(
                style: TextStyle(
                  fontSize: 20,
                ),
                initialValue: linkImage,
                decoration: InputDecoration(
                  hintText: 'Image',
                ),
                onChanged: linkImageChanged,
                onEditingComplete: () {
                  setState();
                },
              ),
            ),
          ],
        ),
      );
}

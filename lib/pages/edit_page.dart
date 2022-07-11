import 'package:flutter/material.dart';
import 'package:list_products_code_fresher/Widget/title_app_bar.dart';
import 'package:list_products_code_fresher/model/product.dart';
import 'package:list_products_code_fresher/Widget/product_form_widget.dart';

class EditPage extends StatefulWidget {
  EditPage({super.key, this.product});
  Product? product;
  // final List<Product> list;
  // final int index;
  _editPageState createState() => _editPageState();
}

class _editPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late double price;
  late String description;
  late String linkImage;

  void initState() {
    super.initState();

    title = widget.product?.title ?? '';
    price = widget.product?.price ?? 0;
    description = widget.product?.description ?? '';
    linkImage = widget.product?.linkImage ?? '';
  }

  Widget _actions() {
    return IconButton(
      icon: Icon(Icons.save),
      onPressed: (() {
        addOrEdit();
      }),
    );
  }

  titleAppBar _title() => titleAppBar(title: 'Edit Product');

  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
        centerTitle: true,
        actions: [_actions()],
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: ProductFormWidget(
            title: title,
            price: price,
            description: description,
            linkImage: linkImage,
            titleChanged: (title) => setState(() => this.title = title),
            priceChanged: (price) => setState(() => this.price = price),
            descriptionChanged: (description) =>
                setState(() => this.description = description),
            linkImageChanged: (imageLink) =>
                setState(() => this.linkImage = imageLink),
          ),
        ),
      ),
    );
  }

  void addOrEdit() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.product != null;

      if (isUpdating) {
        await updateProduct(4);
      } else {
        await addProduct;
      }

      Navigator.of(context).pop();
    }
  }

  Future updateProduct(int index) async {
    final newProduct = widget.product!.copy(
      title: title,
      price: price,
      description: description,
      linkImage: linkImage,
    );
    list[index] = newProduct;
  }

  Future addProduct() async {
    final newProduct = Product(
      title: title,
      price: price,
      description: description,
      linkImage: linkImage,
    );
    list.add(newProduct);
    // Navigator.of(context).pop();
  }
}
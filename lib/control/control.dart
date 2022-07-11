import 'package:list_products_code_fresher/model/product.dart';

class Control {
  // final List<Product> list = [];
  // Control();
  void addList(List<Product> list, Product product) {
    list.add(product);
  }

  removeList(List<Product> list, int i) {
    list.remove(list[i]);
  }

  buildList(List<Product> list, int index) {
    return list[index];
  }
}

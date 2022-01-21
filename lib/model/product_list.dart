import 'package:desktop_app_demo/model/product.dart';

class ProductList {
  int? currentPage;

  List<Product>? itemList;

  ProductList({
    this.currentPage,
    this.itemList,
  });

  ProductList.fromJson(Map<String, dynamic> json)
      : currentPage = json['current_page'],
        itemList = Product.fromJsonArray(json['data']);
}

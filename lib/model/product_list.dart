import 'package:desktop_app_demo/model/product_details.dart';

class ProductList {
  int? currentPage;

  List<Item>? itemList;

  ProductList({
    this.currentPage,
    this.itemList,
  });

  ProductList.fromJson(Map<String, dynamic> json)
      : currentPage = json['current_page'],
        itemList = Item.fromJsonArray(json['data']);
}

class Product {
  int? id;

  String? name;
  int? mrp;
  int? selling;
  String? description;
  String? image;

  Product(
      {this.id,
      this.name,
      this.mrp,
      this.selling,
      this.description,
      this.image});

  static List<Product>? fromJsonArray(List<dynamic>? itemJsonList) {
    List<Product>? itemList =
        itemJsonList?.map((e) => Product.fromJson(e)).toList();
    return itemList;
  }

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        mrp = json['mrp'],
        selling = json['selling'],
        description = json['description'],
        image = json['img'];
}

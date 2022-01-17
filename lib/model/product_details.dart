class Item {
  String? name;
  int? mrp;
  int? selling;
  String? description;
  String? image;

  Item({this.name, this.mrp, this.selling, this.description, this.image});

  static List<Item>? fromJsonArray(List<dynamic>? itemJsonList) {
    List<Item>? itemList = itemJsonList?.map((e) => Item.fromJson(e)).toList();
    return itemList;
  }

  Item.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        mrp = json['mrp'],
        selling = json['selling'],
        description = json['description'],
        image = json['img'];
}

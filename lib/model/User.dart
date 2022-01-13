class User {
  String? name;
  String? email;

  User(
    this.email,
    this.name,
  );

  static List<User>? fromJsonArray(List<dynamic>? userJsonList) {
    List<User>? userList = userJsonList?.map((e) => User.fromJson(e)).toList();
    return userList;
  }

  User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        name = json['name'];
}

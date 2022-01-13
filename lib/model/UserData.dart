class UserData {
  String? token;
  String? tokenType;
  bool? status;

  UserData(
     this.token,
      this.tokenType,this.status
      );

  static List<UserData>? fromJsonArray(List<dynamic>? userJsonList) {
    List<UserData>? userDataList =
    userJsonList?.map((e) => UserData.fromJson(e)).toList();
    return userDataList;
  }

  UserData.fromJson(Map<String, dynamic> json)
      : token = json['token'],
        tokenType = json['token_type'],
        status = json['status'];
}

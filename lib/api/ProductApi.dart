import 'dart:convert';

import 'package:desktop_app_demo/Util/SharedPrefenceUtil.dart';
import 'package:desktop_app_demo/model/ProductResponse.dart';
import 'package:desktop_app_demo/model/ProductDetails.dart';
import 'package:desktop_app_demo/model/UserResponse.dart';
import 'package:http/http.dart' as http;

class ProductListAPI {
  static Future<List<Item>?> productListAPI() async {
    final sharedPreferenceUtil = SharedPreferenceUtil.getInstance();
    String? token = await sharedPreferenceUtil
        .getString(SharedPreferenceUtil.TOKEN);
    var url =
        Uri.parse('https://139.59.79.228/flutter-api/public/api/products');
    final response = await http.get(url,
        headers: {'Authorization': 'Bearer $token',},);
    print('Response Code: ${response.statusCode}.');

    if (response.statusCode == 200) {
      final allProductListData =
          ProductResponse.fromJson(jsonDecode(response.body));
      return allProductListData.data!.itemList;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}

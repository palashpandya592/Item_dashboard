import 'package:desktop_app_demo/model/product_response.dart';
import 'package:desktop_app_demo/model/product_details.dart';
import 'package:dio/dio.dart';

class ProductListAPI {
  static Future<List<Item>?> productListAPI(String? token) async {
    var dio = Dio();
    final response = await dio.get(
      'https://139.59.79.228/flutter-api/public/api/products',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );
    if (response.statusCode == 200) {
      final allProductListData = ProductResponse.fromJson(response.data);
      return allProductListData.data!.itemList;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}

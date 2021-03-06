import 'package:desktop_app_demo/model/product.dart';
import 'package:desktop_app_demo/model/product_delete_response.dart';
import 'package:desktop_app_demo/model/product_details.dart';
import 'package:desktop_app_demo/model/product_list.dart';
import 'package:desktop_app_demo/model/add_product_request.dart';
import 'package:desktop_app_demo/model/product_response.dart';
import 'package:desktop_app_demo/rest_api/rest_api.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

class ProductAPI {
  static Future<ProductList?>? productListAPI(String? token, int page) async {
    var dio = Dio();
    final response = await dio.get(
      '${RestAPI.API_BASE_URL}${RestAPI.listProducts}$page',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );
    if (response.statusCode == 200) {
      final allProductListData = ProductResponse.fromJson(response.data);
      return allProductListData.data;
    }
  }

  static Future<ProductDetail?>? productDetailAPI(String? token, int id) async {
    var dio = Dio();
    final response = await dio.get(
      '${RestAPI.API_BASE_URL}${RestAPI.detailProduct}$id',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );
    if (response.statusCode == 200) {
      final allProductListData = ProductDetail.fromJson(response.data);
      return allProductListData;
    }
  }

  static Future<Product?>? addProductAPIWithImage(
      String? token, AddProductRequest product, PlatformFile file) async {
    var dio = Dio();
    FormData formData = FormData.fromMap({
      'name': product.name,
      'description': product.description,
      'mrp': product.mrp,
      'selling': product.selling,
      'image': await MultipartFile.fromFile(file.path!, filename: file.name),
    });
    final response =
        await dio.post('${RestAPI.API_BASE_URL}${RestAPI.addProduct}',
            options: Options(headers: {
              'Authorization': 'Bearer $token',
            }),
            data: formData);

    if (response.statusCode == 200) {
      return Product.fromJson(response.data);
    }
  }

  Future<Product?>? addProductAPIWithoutImage(
    String? token,
    AddProductRequest product,
  ) async {
    var dio = Dio();
    FormData formData = FormData.fromMap({
      'name': product.name,
      'description': product.description,
      'mrp': product.mrp,
      'selling': product.selling,
    });
    final response =
        await dio.post('${RestAPI.API_BASE_URL}${RestAPI.addProduct}',
            options: Options(headers: {
              'Authorization': 'Bearer $token',
            }),
            data: formData);

    if (response.statusCode == 200) {
      return Product.fromJson(response.data);
    }
  }

  Future<Product?>? updateProductAPWithoutImage(
      String? token, AddProductRequest product, int? id) async {
    var dio = Dio();

    final response = await dio.put(
        '${RestAPI.API_BASE_URL}${RestAPI.updateProduct}$id',
        options:
            Options(contentType: Headers.formUrlEncodedContentType, headers: {
          'Authorization': 'Bearer $token',
        }),
        data: {
          'name': product.name,
          'description': product.description,
          'mrp': product.mrp,
          'selling': product.selling,
        });

    if (response.statusCode == 200) {
      final productUpdateData = Product.fromJson(response.data);
      return productUpdateData;
    }
  }

  Future<Product?>? updateProductAPIWithImage(String? token,
      AddProductRequest product, int id, PlatformFile file) async {
    var dio = Dio();
    final response = await dio.put(
        '${RestAPI.API_BASE_URL}${RestAPI.updateProduct}$id',
        options:
            Options(contentType: Headers.formUrlEncodedContentType, headers: {
          'Authorization': 'Bearer $token',
        }),
        data: {
          'name': product.name,
          'description': product.description,
          'mrp': product.mrp,
          'selling': product.selling,
          'image': MultipartFile.fromFile(file.path!, filename: file.name),
        });

    if (response.statusCode == 200) {
      final productUpdateData = Product.fromJson(response.data);
      return productUpdateData;
    }
  }

  static Future<DeleteProductResponse?>? deleteProductAPI(
      String? token, int id) async {
    var dio = Dio();
    final response = await dio.delete(
      '${RestAPI.API_BASE_URL}${RestAPI.deleteProduct}$id',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );

    if (response.statusCode == 200) {
      final productDelete = DeleteProductResponse.fromJson(response.data);
      return productDelete;
    }
  }
}

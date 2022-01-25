import 'package:desktop_app_demo/model/login_request.dart';
import 'package:desktop_app_demo/model/user_response.dart';
import 'package:desktop_app_demo/rest_api/rest_api.dart';
import 'package:dio/dio.dart';

class LoginAPI {
  Future<UserResponse?> loginAPI(LoginRequest loginRequest) async {
    var dio = Dio();
    Map<String, dynamic> request = {
      "email": loginRequest.email,
      "password": loginRequest.password != null
          ? int.tryParse(loginRequest.password!)
          : 0
    };
    FormData formData = FormData.fromMap(request);
    final response = await dio.post(
        '${RestAPI.API_BASE_URL}${RestAPI.loginAPI}',
        options: Options(headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, OPTIONS, PUT, PATCH, DELETE' ,// If needed
        'Access-Control-Allow-Headers': 'X-Requested-With,content-type' ,// If needed
        'Access-Control-Allow-Credentials': true // If  needed,

        }),
        data: formData);
    if (response.statusCode == 200) {
      return UserResponse.fromJson(response.data);
    }
  }
}

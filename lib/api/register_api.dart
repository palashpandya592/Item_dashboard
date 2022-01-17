import 'dart:convert';

import 'package:desktop_app_demo/model/register_request.dart';
import 'package:http/http.dart' as http;

class RegisterAPI {
  loginAPI(RegisterRequest registerRequest) async {
    var url =
        Uri.parse('https://139.59.79.228/flutter-api/public/api/register');
    final response = await http.post(url, body: jsonEncode(registerRequest));
    if (response.statusCode == 200) {
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}

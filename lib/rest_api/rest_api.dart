class RestAPI {
  static const String API_BASE_URL = "https://139.59.79.228";

  static const int STATUS_CODE_0K = 200;
  static const int STATUS_CODE_CREATED = 201;
  static const int STATUS_CODE_UNAUTHORIZED = 401;
  static const int STATUS_CODE_BAD_REQUEST = 400;
  static const int STATUS_CODE_CONFLICTS = 409;

  ///API End Points
  static const String loginAPI = "/flutter-api/public/api/login";
  static const String registerUser = "/flutter-api/public/api/register";
  static const String addProduct = "/flutter-api/public/api/products";
  static const String updateProduct = "/flutter-api/public/api/products/";
  static const String listProducts = "/flutter-api/public/api/products?page=";
  static const String detailProduct = "/flutter-api/public/api/products/";
  static const String deleteProduct = "/flutter-api/public/api/products/";
}

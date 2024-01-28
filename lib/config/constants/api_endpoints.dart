class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  // For Windows
  // static const String baseUrl = "http://10.0.2.2:5000/api/";
  static const String baseUrl = "http://192.168.1.67:5000/api/";

  // For MAC
  // static const String baseUrl = "http://10.0.2.2:5000/";

  //From WIFI or IP config
  //static const String baseUrl = "http://192.168.4.4:3000/api/v1/";

  // ====================== Auth Routes ======================
  static const String login = "auth/login";
  static const String register = "users/create";
}

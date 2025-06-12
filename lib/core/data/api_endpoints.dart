abstract class ApiEndpoints {
  static String get _baseUrl => "https://reqres.in";

  static String get login => "$_baseUrl/api/login";
  static String get register => "$_baseUrl/api/register";

}
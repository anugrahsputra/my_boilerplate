import 'dart:convert';

class Parser {
  static T? get<T>(dynamic object) {
    try {
      return object;
    } catch (e) {
      return null;
    }
  }

  static Map<String, dynamic>? getMap(dynamic data) {
    try {
      final Map<String, dynamic> result =
          jsonDecode(data) as Map<String, dynamic>;

      return result;
    } catch (_) {
      return null;
    }
  }
}

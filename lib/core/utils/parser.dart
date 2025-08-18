import 'dart:convert';

class Parser {
  static T? get<T>(dynamic object) {
    try {
      return object as T?;
    } catch (e) {
      return null;
    }
  }

  static Map<String, dynamic>? getMap(dynamic data) {
    try {
      final result =
          jsonDecode(data is String ? data : data.toString())
              as Map<String, dynamic>;

      return result;
    } catch (_) {
      return null;
    }
  }
}

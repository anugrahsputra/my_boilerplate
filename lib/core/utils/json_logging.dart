import 'dart:convert';

String prettyPrintJson(String jsonString) {
  final jsonObject = jsonDecode(jsonString) as Map<String, dynamic>;
  final prettyString = _printJson(jsonObject);

  return prettyString;
}

String _printJson(Map<String, dynamic> jsonObject, {int indent = 0}) {
  var prettyString = '';
  prettyString += '{\n';
  var index = 0;
  jsonObject.forEach((key, value) {
    prettyString += '${" " * (indent + 2)}"$key": ';
    if (value is String) {
      prettyString += '"$value"';
    } else if (value is Map<String, dynamic>) {
      prettyString += _printJson(value, indent: indent + 2);
    } else if (value is List) {
      prettyString += jsonEncode(value);
    } else {
      prettyString += value.toString();
    }
    prettyString += (index < jsonObject.length - 1) ? ',\n' : '\n';
    index++;
  });
  return prettyString += "${" " * indent}}";
}

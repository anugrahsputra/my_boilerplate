import 'dart:convert';

String prettyPrintJson(jsonString) {
  var jsonObject = jsonDecode(jsonString);
  String prettyString = _printJson(jsonObject);

  return prettyString;
}

String _printJson(jsonObject, {int indent = 0}) {
  String prettyString = "";
  if (jsonObject is Map) {
    prettyString += "{\n";
    int index = 0;
    jsonObject.forEach((key, value) {
      prettyString += "${" " * (indent + 2)}\"$key\": ";
      if (value is String) {
        prettyString += "\"$value\"";
      } else {
        prettyString += _printJson(value, indent: indent + 2);
      }
      prettyString += (index < jsonObject.length - 1) ? ",\n" : "\n";
      index++;
    });
    prettyString += "${" " * indent}}";
  } else if (jsonObject is List) {
    prettyString += "[\n";
    for (var i = 0; i < jsonObject.length; i++) {
      prettyString += " " * (indent + 2);
      prettyString += _printJson(jsonObject[i], indent: indent + 2);
      prettyString += (i < jsonObject.length - 1) ? ",\n" : "\n";
    }
    prettyString += "${" " * indent}]";
  } else {
    prettyString += jsonObject.toString();
  }
  return prettyString;
}

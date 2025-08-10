import 'dart:isolate';

import 'package:my_boilerplate/core/core.dart';

// use this for single object response
class IsolateParser<T> {
  final Map<String, dynamic> json;
  final ResponseConverter<T> converter;

  IsolateParser(this.json, this.converter);

  Future<T> parseInBackground() async {
    final port = ReceivePort();
    await Isolate.spawn<_ParserPayload<T>>(
      _parseAndSend,
      _ParserPayload(json, converter, port.sendPort),
    );

    return await port.first as T;
  }

  static void _parseAndSend<T>(_ParserPayload<T> payload) {
    final result = payload.converter(payload.json);
    Isolate.exit(payload.sendPort, result);
  }
}

class _ParserPayload<T> {
  final Map<String, dynamic> json;
  final ResponseConverter<T> converter;
  final SendPort sendPort;

  _ParserPayload(this.json, this.converter, this.sendPort);
}

// use this for list if response is a list of objects
class IsolateListParser<T> {
  final List<dynamic> jsonList;
  final T Function(Map<String, dynamic>) converter;

  IsolateListParser(this.jsonList, this.converter);

  Future<List<T>> parseInBackground() async {
    final port = ReceivePort();
    await Isolate.spawn<_ListParserPayload<T>>(
      _parseAndSend,
      _ListParserPayload<T>(jsonList, converter, port.sendPort),
    );

    return await port.first as List<T>;
  }

  static void _parseAndSend<T>(_ListParserPayload<T> payload) {
    final result = payload.jsonList
        .map<T>((e) => payload.converter(e as Map<String, dynamic>))
        .toList();

    Isolate.exit(payload.sendPort, result);
  }
}

class _ListParserPayload<T> {
  final List<dynamic> jsonList;
  final T Function(Map<String, dynamic>) converter;
  final SendPort sendPort;

  _ListParserPayload(this.jsonList, this.converter, this.sendPort);
}

import 'dart:isolate';

import 'package:my_boilerplate/core/core.dart';

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
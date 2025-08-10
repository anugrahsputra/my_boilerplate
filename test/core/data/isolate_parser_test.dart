import 'package:flutter_test/flutter_test.dart';
import 'package:my_boilerplate/core/core.dart';

void main() {
  group('IsolateParser', () {
    test('parseInBackground should return parsed data', () async {
      final json = {'key': 'value'};
      converter(Map<String, dynamic> json) => json['key'] as String;
      final parser = IsolateParser<String>(json, converter);

      final result = await parser.parseInBackground();

      expect(result, 'value');
    });
  });
}
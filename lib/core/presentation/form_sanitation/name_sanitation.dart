import 'package:formz/formz.dart';

enum NameValidationError { empty, tooShort }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');

  const Name.dirty([super.value = '']) : super.dirty();

  @override
  NameValidationError? validator(String value) {
    if (value.trim().isEmpty) return NameValidationError.empty;
    if (value.trim().length < 3) return NameValidationError.tooShort;
    return null;
  }
}
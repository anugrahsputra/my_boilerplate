import 'package:formz/formz.dart';

enum EmailValidationError { invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([super.value = '']) : super.dirty();

  static final _regex = RegExp(r"^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$");

  @override
  EmailValidationError? validator(String value) {
    return _regex.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}

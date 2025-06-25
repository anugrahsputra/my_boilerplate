import 'package:formz/formz.dart';

enum PhoneNumberValidationError { empty, invalid}

class PhoneNumber extends FormzInput<String, PhoneNumberValidationError> {
  const PhoneNumber.pure() : super.pure('');
  const PhoneNumber.dirty([super.value = '']) : super.dirty();

  static final _phoneRegExp = RegExp(r'^(?:\+62|62|0)8[1-9][0-9]{6,9}$');

  @override
  PhoneNumberValidationError? validator(String value) {
    if (value.trim().isEmpty) {
      return PhoneNumberValidationError.empty;
    }
    return _phoneRegExp.hasMatch(value) ? null : PhoneNumberValidationError.invalid;
  }
}
import 'package:flutter_test/flutter_test.dart';
import 'package:my_boilerplate/core/presentation/form_sanitation/email_sanitation.dart';

void main() {
  group('Email', () {
    group('constructors', () {
      test('should return empty value when pure constructor is used', () {
        expect(const Email.pure().value, '');
      });

      test(
        'should return same value when dirty constructor is used with valid email',
        () {
          expect(
            const Email.dirty('test@example.com').value,
            'test@example.com',
          );
        },
      );

      test(
        'should return same value when dirty constructor is used with invalid email',
        () {
          expect(const Email.dirty('invalid-email').value, 'invalid-email');
        },
      );

      test(
        'should return empty value when dirty constructor is used with empty string',
        () {
          expect(const Email.dirty('').value, '');
        },
      );
    });

    group('validator', () {
      test('should return null when value is valid email', () {
        expect(const Email.dirty('test@example.com').error, null);
      });

      test('should return null when value is valid email with subdomain', () {
        expect(const Email.dirty('test@sub.example.com').error, null);
      });

      test('should return null when value is valid email with numbers', () {
        expect(const Email.dirty('test123@example.com').error, null);
      });

      test('should return null when value is valid email with dots', () {
        expect(const Email.dirty('test.name@example.com').error, null);
      });

      test(
        'should return error when value has plus (not supported by regex)',
        () {
          expect(
            const Email.dirty('test+tag@example.com').error,
            EmailValidationError.invalid,
          );
        },
      );

      test('should return null when value is valid email with underscore', () {
        expect(const Email.dirty('test_name@example.com').error, null);
      });

      test('should return null when value is valid email with dash', () {
        expect(const Email.dirty('test-name@example.com').error, null);
      });

      test(
        'should return null when value is valid email with multiple dots',
        () {
          expect(const Email.dirty('test.name@example.co.uk').error, null);
        },
      );

      test('should return error when value is empty', () {
        expect(const Email.dirty('').error, EmailValidationError.invalid);
      });

      test('should return error when value is invalid email format', () {
        expect(
          const Email.dirty('invalid-email').error,
          EmailValidationError.invalid,
        );
      });

      test('should return error when value is missing @ symbol', () {
        expect(
          const Email.dirty('testexample.com').error,
          EmailValidationError.invalid,
        );
      });

      test('should return error when value is missing domain', () {
        expect(const Email.dirty('test@').error, EmailValidationError.invalid);
      });

      test('should return error when value is missing local part', () {
        expect(
          const Email.dirty('@example.com').error,
          EmailValidationError.invalid,
        );
      });

      test('should return error when value has spaces', () {
        expect(
          const Email.dirty('test @example.com').error,
          EmailValidationError.invalid,
        );
      });

      test('should return error when value has multiple @ symbols', () {
        expect(
          const Email.dirty('test@@example.com').error,
          EmailValidationError.invalid,
        );
      });

      test(
        'should return null when value starts with dot (regex allows it)',
        () {
          expect(const Email.dirty('.test@example.com').error, null);
        },
      );

      test('should return null when value ends with dot (regex allows it)', () {
        expect(const Email.dirty('test.@example.com').error, null);
      });

      test('should return error when domain starts with dot', () {
        expect(
          const Email.dirty('test@.example.com').error,
          EmailValidationError.invalid,
        );
      });

      test('should return error when domain ends with dot', () {
        expect(
          const Email.dirty('test@example.com.').error,
          EmailValidationError.invalid,
        );
      });
    });

    group('dirty constructor', () {
      test('should return same value when value is valid', () {
        expect(const Email.dirty('test@example.com').value, 'test@example.com');
      });

      test('should return same value when value is invalid', () {
        expect(const Email.dirty('invalid-email').value, 'invalid-email');
      });

      test('should return same value when value is empty', () {
        expect(const Email.dirty('').value, '');
      });
    });

    group('isValid', () {
      test('should return true when value is valid email', () {
        expect(const Email.dirty('test@example.com').isValid, true);
      });

      test('should return false when value is invalid email', () {
        expect(const Email.dirty('invalid-email').isValid, false);
      });

      test('should return false when value is empty', () {
        expect(const Email.dirty('').isValid, false);
      });
    });

    group('isNotValid', () {
      test('should return false when value is valid email', () {
        expect(const Email.dirty('test@example.com').isNotValid, false);
      });

      test('should return true when value is invalid email', () {
        expect(const Email.dirty('invalid-email').isNotValid, true);
      });

      test('should return true when value is empty', () {
        expect(const Email.dirty('').isNotValid, true);
      });
    });
  });
}

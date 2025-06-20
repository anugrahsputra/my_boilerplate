import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';

@freezed
abstract class Login with _$Login {
  const factory Login({required String token}) =
      _Login;
}
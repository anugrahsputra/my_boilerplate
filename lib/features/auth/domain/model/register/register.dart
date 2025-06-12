import 'package:freezed_annotation/freezed_annotation.dart';

part 'register.freezed.dart';

@freezed
abstract class Register with _$Register {
  const factory Register({required int id, required String token}) =
      _Register;
}
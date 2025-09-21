// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get registerTitle => 'Daftar';

  @override
  String get registerSubtitle =>
      'Silakan Daftar untuk melanjutkan menggunakan aplikasi';

  @override
  String get fullNameHint => 'Nama Lengkap';

  @override
  String get nameTooShortError => 'Nama terlalu pendek';

  @override
  String get nameEmptyError => 'Nama tidak boleh kosong';

  @override
  String get phoneNumberHint => 'Nomor HP';

  @override
  String get phoneNumberInvalidError => 'Nomor HP tidak valid';

  @override
  String get emailHint => 'Email';

  @override
  String get emailInvalidError => 'Email tidak valid';

  @override
  String get passwordHint => 'Kata Sandi';

  @override
  String get passwordEmptyError => 'Password tidak boleh kosong';

  @override
  String get loginTitle => 'Masuk';

  @override
  String get loginSubtitle =>
      'Silakan Masuk untuk melanjutkan menggunakan aplikasi';

  @override
  String get loginButton => 'Masuk';

  @override
  String get registerButton => 'Daftar';

  @override
  String get registerSuccess => 'Daftar Berhasil';

  @override
  String get dontHaveAccount => 'Belum punya akun? ';

  @override
  String get alreadyHaveAccount => 'Sudah punya akun? ';

  @override
  String get homeTab => 'Beranda';

  @override
  String get searchTab => 'Cari';

  @override
  String get favoriteTab => 'Favorit';

  @override
  String get profileTab => 'Profil';

  @override
  String get homePageTitle => 'Beranda';

  @override
  String get searchPageTitle => 'Cari';

  @override
  String get favoritePageTitle => 'Favorit';

  @override
  String get profilePageTitle => 'Profil';

  @override
  String get logoutButton => 'Keluar';

  @override
  String get homePageContent => 'halaman beranda';

  @override
  String get searchPageContent => 'Halaman Pencarian';

  @override
  String get favoritePageContent => 'Halaman Favorit';

  @override
  String get profilePageContent => 'Halaman Profil';

  @override
  String get appTitle => 'Demo Flutter';
}

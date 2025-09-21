// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get registerTitle => 'Register';

  @override
  String get registerSubtitle => 'Please Sign Up to continue using the app';

  @override
  String get fullNameHint => 'Full Name';

  @override
  String get nameTooShortError => 'Name is too short';

  @override
  String get nameEmptyError => 'Name cannot be empty';

  @override
  String get phoneNumberHint => 'Phone Number';

  @override
  String get phoneNumberInvalidError => 'Phone number is invalid';

  @override
  String get emailHint => 'Email';

  @override
  String get emailInvalidError => 'Email is invalid';

  @override
  String get passwordHint => 'Password';

  @override
  String get passwordEmptyError => 'Password cannot be empty';

  @override
  String get loginTitle => 'Login';

  @override
  String get loginSubtitle => 'Please Login to continue using the app';

  @override
  String get loginButton => 'Login';

  @override
  String get registerButton => 'Register';

  @override
  String get registerSuccess => 'Register Success';

  @override
  String get dontHaveAccount => 'Don\'t have account? ';

  @override
  String get alreadyHaveAccount => 'Already have an account? ';

  @override
  String get homeTab => 'Home';

  @override
  String get searchTab => 'Search';

  @override
  String get favoriteTab => 'Favorite';

  @override
  String get profileTab => 'Profile';

  @override
  String get homePageTitle => 'Home';

  @override
  String get searchPageTitle => 'Search';

  @override
  String get favoritePageTitle => 'Favorite';

  @override
  String get profilePageTitle => 'Profile';

  @override
  String get logoutButton => 'Logout';

  @override
  String get homePageContent => 'home page';

  @override
  String get searchPageContent => 'Search View';

  @override
  String get favoritePageContent => 'Favorite View';

  @override
  String get profilePageContent => 'Profile View';

  @override
  String get appTitle => 'Flutter Demo';
}

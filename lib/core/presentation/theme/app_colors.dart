import 'package:flutter/material.dart';

abstract class AppColors {
  /* -------------------> Light Color <------------------- */
  static Brightness get brightness => Brightness.light;
  static Color get primary => const Color(0xffb86914);
  static Color get onPrimary => const Color(0xffffffff);
  static Color get primaryContainer => const Color(0xfff2c18c);
  static Color get onPrimaryContainer => const Color(0xff14100c);
  static Color get secondary => const Color(0xffef6c00);
  static Color get onSecondary => const Color(0xffffffff);
  static Color get secondaryContainer => const Color(0xffffbe93);
  static Color get onSecondaryContainer => const Color(0xff14100d);
  static Color get tertiary => const Color(0xffb36832);
  static Color get onTertiary => const Color(0xffffffff);
  static Color get tertiaryContainer => const Color(0xffca9d7c);
  static Color get onTertiaryContainer => const Color(0xff110d0b);
  static Color get error => const Color(0xff790000);
  static Color get onError => const Color(0xffffffff);
  static Color get errorContainer => const Color(0xfff1d8d8);
  static Color get onErrorContainer => const Color(0xff141212);
  static Color get background => const Color(0xfffcfbfa);
  static Color get onBackground => const Color(0xff0e0e0e);
  static Color get surface => const Color(0xfffefdfd);
  static Color get onSurface => const Color(0xff090909);
  static Color get surfaceVariant => const Color(0xffedebea);
  static Color get onSurfaceVariant => const Color(0xff121212);
  static Color get outline => const Color(0xff818181);
  static Color get outlineVariant => const Color(0xffcdcdcd);
  static Color get shadow => const Color(0xff000000);
  static Color get scrim => const Color(0xff000000);
  static Color get inverseSurface => const Color(0xff121111);
  static Color get onInverseSurface => const Color(0xfff5f5f5);
  static Color get inversePrimary => const Color(0xffffe1ad);
  static Color get surfaceTint => const Color(0xffb86914);

  /* -------------------> Dark Color <------------------- */
  static Brightness get brightnessDark => Brightness.dark;
  static Color get primaryDark => const Color(0xffeda85e);
  static Color get onPrimaryDark => const Color(0xff080604);
  static Color get primaryContainerDark => const Color(0xffb86914);
  static Color get onPrimaryContainerDark => const Color(0xfffef9f3);
  static Color get secondaryDark => const Color(0xffd28f60);
  static Color get onSecondaryDark => const Color(0xff080604);
  static Color get secondaryContainerDark => const Color(0xffb5642c);
  static Color get onSecondaryContainerDark => const Color(0xfffdf8f5);
  static Color get tertiaryDark => const Color(0xffddab88);
  static Color get onTertiaryDark => const Color(0xff080605);
  static Color get tertiaryContainerDark => const Color(0xffbf7d4e);
  static Color get onTertiaryContainerDark => const Color(0xfffefaf7);
  static Color get errorDark => const Color(0xffcf6679);
  static Color get onErrorDark => const Color(0xff080405);
  static Color get errorContainerDark => const Color(0xffb1384e);
  static Color get onErrorContainerDark => const Color(0xfffdf6f7);
  static Color get backgroundDark => const Color(0xff1a1713);
  static Color get onBackgroundDark => const Color(0xfff4f4f3);
  static Color get surfaceDark => const Color(0xff171513);
  static Color get onSurfaceDark => const Color(0xfff7f7f7);
  static Color get surfaceVariantDark => const Color(0xff3d3934);
  static Color get onSurfaceVariantDark => const Color(0xfff2f2f2);
  static Color get outlineDark => const Color(0xff86867b);
  static Color get outlineVariantDark => const Color(0xff373732);
  static Color get shadowDark => const Color(0xff000000);
  static Color get scrimDark => const Color(0xff000000);
  static Color get inverseSurfaceDark => const Color(0xfffefcf9);
  static Color get onInverseSurfaceDark => const Color(0xff070707);
  static Color get inversePrimaryDark => const Color(0xff715536);
  static Color get surfaceTintDark => const Color(0xffeda85e);
}

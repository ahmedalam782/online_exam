import 'package:flutter/material.dart';

class Insets {
  static const double s2 = 2.0;
  static const double s4 = 4.0;
  static const double s6 = 6.0;
  static const double s8 = 8.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s24 = 24.0;
}

abstract class AppConstants {
  static const String sfPro = 'SF Pro';
  static const String roboto = 'Roboto';
  static const String inter = 'Inter';
  static const String pathTranslation = "assets/translations";
  static const Locale arabicLocale = Locale("ar");
  static const Locale englishLocale = Locale("en");
  static const List<Locale> supportedLocales = [englishLocale, arabicLocale];
}



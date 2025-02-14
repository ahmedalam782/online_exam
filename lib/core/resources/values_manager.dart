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
  static const Locale arabicLocale = Locale("ar", "EG");
  static const Locale englishLocale = Locale("en", "US");
  static const List<Locale> supportedLocales = [englishLocale, arabicLocale];
}

class BaseLanguage{
  static const String password = 'Password';
  static const String forgetPassword = 'Forget password';
  static const String forgetPasswordParagraph = 'Please enter your email associated to \n your account';
  static const String email = 'Email';
  static const String enterYourEmail = 'Enter Your Email';
  static const String emailNotValid = 'This Email is not valid';
  static const String continueWord = 'Continue';
  static const String resetPasswordParagraph = 'Password must not be empty and must contain \n 6 characters with upper case letter and one \n number at least ';
  static const String newPassword = 'New password';
  static const String confirmPassword = 'Confirm password';
  static const String enterYourPassword = 'Enter your password';
  static const String emailVerification = 'Email verification';
  static const String emailVerificationParagraph = 'Please enter your code that send to your \n email address';
  static const String codeNotReceived = "Didn't receive code?";
  static const String resend = 'Resend';
  static const String invalidCode = 'Invalid code';





}

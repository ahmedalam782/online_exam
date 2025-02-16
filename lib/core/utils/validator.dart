import 'package:easy_localization/easy_localization.dart';
import 'package:online_exam/core/resources/values_manager.dart';

import '../../generated/locale_keys.g.dart';

class Validator {
  Validator._();

  static String? validateEmail(String? val) {
    final RegExp emailRegex = RegExp(
      AppConstants.emailRegex,
    );
    if (val == null) {
      return LocaleKeys.fieldEmpty.tr();
    } else if (val.trim().isEmpty) {
      return LocaleKeys.fieldEmpty.tr();
    } else if (emailRegex.hasMatch(val) == false) {
      return LocaleKeys.emailValid.tr();
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    final RegExp passwordRegex = RegExp(AppConstants.passwordRegex);
    if (val == null) {
      return LocaleKeys.fieldEmpty.tr();
    } else if (val.isEmpty) {
      return LocaleKeys.fieldEmpty.tr();
    }
    else if (!passwordRegex.hasMatch(val)) {
      return LocaleKeys.weakPassword.tr();
    }
    else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return LocaleKeys.fieldEmpty.tr();
    } else if (val != password) {
      return LocaleKeys.passwordNotMatch.tr();
    } else {
      return null;
    }
  }

  static String? validateUsername(String? val) {
    final RegExp usernameRegex = RegExp(AppConstants.usernameRegex);
    if (val == null) {
      return LocaleKeys.fieldEmpty.tr();
    } else if (val.isEmpty) {
      return LocaleKeys.fieldEmpty.tr();
    } else if (!usernameRegex.hasMatch(val)) {
      return LocaleKeys.userNameValid.tr();
    } else {
      return null;
    }
  }

  static String? validateName(String? val) {
    if (val == null || val.isEmpty) {
      return LocaleKeys.fieldEmpty.tr();
    } else {
      return null;
    }
  }

  static String? validateYearsOfExperience(String? val) {
    if (val == null || val.isEmpty) {
      return LocaleKeys.fieldEmpty.tr();
    } else if (int.tryParse(val.trim()) == null) {
      return LocaleKeys.numberOnlyValid.tr();
    } else {
      return null;
    }
  }

  static String? validateLevelOfExperience(String? val) {
    if (val == null || val.isEmpty) {
      return LocaleKeys.fieldEmpty.tr();
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? val) {
    if (val == null) {
      return LocaleKeys.fieldEmpty.tr();
    } else if (int.tryParse(val.trim()) == null) {
      return  LocaleKeys.numberOnlyValid.tr();
    } else if (val.trim().length != 10) {
      return LocaleKeys.phoneValid.tr();
    } else {
      return null;
    }
  }
}

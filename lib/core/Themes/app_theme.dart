import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        scaffoldBackgroundColor: ColorManager.lightGray,
        primaryColor: ColorManager.blue,
        appBarTheme: AppBarTheme(
          centerTitle: false,
          backgroundColor: ColorManager.lightGray,
          elevation: 0,
          titleTextStyle: getBoldStyle(
            color: ColorManager.darkGray,
            fontSize: FontSize.s16,
            context: context,
          ),
        ),   
      );
}

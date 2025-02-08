import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/size_config.dart';
import 'color_manager.dart';
import 'font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  double? height,
  Color color,
  double? letterSpacing,
  String? fontFamily,
) =>
    TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: fontFamily ?? 'SF Pro',
      height: height,
      letterSpacing: letterSpacing,
    );

TextStyle getLightStyle({
  double? fontSize,
  double? height,
  required Color color,
  double? letterSpacing,
  required BuildContext context,
  String? fontFamily,
}) =>
    _getTextStyle(getResponsiveFontSize(fontSize ?? FontSize.s12, context),
        FontWeightManager.light, height, color, letterSpacing, fontFamily);

TextStyle getRegularStyle({
  double? fontSize,
  double? height,
  required Color color,
  double? letterSpacing,
  required BuildContext context,
  String? fontFamily,
}) =>
    _getTextStyle(
      getResponsiveFontSize(fontSize ?? FontSize.s12, context),
      FontWeightManager.regular,
      height,
      color,
      letterSpacing,
      fontFamily,
    );

TextStyle getMediumStyle({
  double? fontSize,
  double? height,
  required Color color,
  double? letterSpacing,
  required BuildContext context,
  String? fontFamily,
}) =>
    _getTextStyle(
      getResponsiveFontSize(fontSize ?? FontSize.s12, context),
      FontWeightManager.medium,
      height,
      color,
      letterSpacing,
      fontFamily,
    );

TextStyle getSemiBoldStyle({
  double? fontSize,
  double? height,
  required Color color,
  double? letterSpacing,
  required BuildContext context,
  String? fontFamily,
}) =>
    _getTextStyle(
      getResponsiveFontSize(fontSize ?? FontSize.s12, context),
      FontWeightManager.semiBold,
      height,
      color,
      letterSpacing,
      fontFamily,
    );

TextStyle getBoldStyle({
  double? fontSize,
  double? height,
  required Color color,
  double? letterSpacing,
  required BuildContext context,
  String? fontFamily,
}) =>
    _getTextStyle(
      getResponsiveFontSize(fontSize ?? FontSize.s12, context),
      FontWeightManager.bold,
      height,
      color,
      letterSpacing,
      fontFamily,
    );

TextStyle getTextWithLine(
        {double? fontSize,
        required BuildContext context,
        String? fontFamily}) =>
    TextStyle(
      color: ColorManager.darkGray,
      fontSize: getResponsiveFontSize(fontSize ?? FontSize.s16, context),
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.lineThrough,
      decorationColor: ColorManager.darkGray,
      fontFamily: fontFamily ?? 'SF Pro',
    );

double getResponsiveFontSize(double fontSize, BuildContext context) {
  double scaleFactor = getScaleFactor(context);
  double responsiveSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  return responsiveSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  if (width < SizeConfig.tablet) {
    return width / 400;
  } else if (width < SizeConfig.desktop) {
    return width / 700;
  } else {
    return width / 1000;
  }
}

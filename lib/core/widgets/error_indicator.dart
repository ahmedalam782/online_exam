import 'package:flutter/material.dart';
import 'package:online_exam/core/resources/color_manager.dart';
import 'package:online_exam/core/resources/font_manager.dart';
import 'package:online_exam/core/resources/styles_manager.dart';
import 'package:online_exam/core/resources/values_manager.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * .09),
        child: Text(
          message ?? " SomeThing went Wrong!",
          style: getMediumStyle(
            color: ColorManager.darkGray,
            fontSize: FontSize.s16,
            context: context,
            fontFamily: AppConstants.sfPro,
          ),
        ),
      ),
    );
  }
}

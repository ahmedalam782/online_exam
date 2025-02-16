import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_exam/core/resources/color_manager.dart';
import 'package:online_exam/core/resources/font_manager.dart';
import 'package:online_exam/core/resources/styles_manager.dart';
import 'package:online_exam/core/resources/values_manager.dart';
import 'package:online_exam/core/widgets/loading_indicator.dart';

class UiUtils {
  static void showLoadingDialog(BuildContext context) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => PopScope(
          canPop: false,
          child: AlertDialog(
              backgroundColor: ColorManager.lightGray,
              content: SizedBox(
                height: MediaQuery.of(context).size.height * .2,
                width: MediaQuery.of(context).size.width * .01,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingIndicator(),
                  ],
                ),
              )),
        ),
      );

  static void showConnectionDialog(BuildContext context) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => PopScope(
          canPop: false,
          child: AlertDialog(
            title: Text(
              "Connection Problem",
              style: getBoldStyle(
                color: ColorManager.darkGray,
                fontSize: FontSize.s24,
                context: context,
                fontFamily: AppConstants.inter,
              ),
            ),
            backgroundColor: ColorManager.pureWhite,
            content: Text(
              "Something went wrong.\nplease check your internet connection and try again.",
              style: getSemiBoldStyle(
                color: ColorManager.darkGray,
                fontSize: FontSize.s13,
                context: context,
                fontFamily: AppConstants.inter,
              ),
            ),
            actions: [
              TextButton(
                child: Text(
                  "OK",
                  style: getBoldStyle(
                    color: ColorManager.blue,
                    fontSize: FontSize.s16,
                    context: context,
                    fontFamily: AppConstants.inter,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );

  static void hideLoadingDialog(BuildContext context) => Navigator.pop(context);
  static void showMessageToast(String message) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorManager.lightGray,
        textColor: ColorManager.darkGray,
        fontSize: FontSize.s16,
        // fontAsset: AppConstants.inter,
      );
}

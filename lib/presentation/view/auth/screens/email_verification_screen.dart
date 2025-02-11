import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam/core/resources/color_manager.dart';
import 'package:online_exam/core/resources/font_manager.dart';
import 'package:online_exam/core/routes/routes.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/resources/values_manager.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _pinFocusNode = FocusNode();
  bool inValid = false;
  String? _errorText;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: (344.w) / 4,
      height: 68.h,
      textStyle: TextStyle(fontSize: 20.sp, color: Colors.black),
      decoration: BoxDecoration(
        color: ColorManager.iceBlue,
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.red),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(BaseLanguage.password)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                BaseLanguage.emailVerification,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                BaseLanguage.emailVerificationParagraph,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 24.h,
              ),
              Pinput(
                length: 4,
                controller: _pinController,
                focusNode: _pinFocusNode,
                defaultPinTheme: defaultPinTheme,
                errorPinTheme: errorPinTheme,
                validator: (code) {
                  if (code == "1234") {
                    setState(() {
                      _errorText = null;
                    });
                    Navigator.pushNamed(context, Routes.resetPassword);
                    return null;
                  } else {
                    setState(() {
                      _errorText = "";
                    });
                    return "";
                  }
                },
              ),
              if (_errorText != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/InvalidCode.svg',
                      width: 13.w,
                      height: 13.h,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      BaseLanguage.invalidCode,
                      style: TextStyle(color: ColorManager.red),
                    )
                  ],
                ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(BaseLanguage.codeNotReceived,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: FontSize.s16)),
                  SizedBox(
                    width: 5.h,
                  ),
                  InkWell(
                    onTap: () {
                      // handle the resend
                    },
                    child: Text(
                      BaseLanguage.resend,
                      style: TextStyle(
                        color: ColorManager.blue,
                        fontSize: FontSize.s16,
                        decoration: TextDecoration.underline,
                        decorationColor: ColorManager.blue
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

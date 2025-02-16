import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/resources/color_manager.dart';
import 'package:online_exam/core/utils/validator.dart';
import 'package:online_exam/core/widgets/custom_button.dart';
import 'package:online_exam/core/widgets/custom_text_form_field.dart';
import 'package:online_exam/generated/locale_keys.g.dart';
import '../../../../core/routes/routes.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final ValueNotifier<bool> isValid = ValueNotifier(false);
  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmail);
  }

  void _validateEmail() {
    isValid.value = Validator.validateEmail(_emailController.text) == null;
  }

  @override
  void dispose() {
    _emailController.removeListener(_validateEmail);
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.password.tr())),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.forgetPassword.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 18.h,
            ),
            Text(
              LocaleKeys.forgetPasswordParagraph.tr(),
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 18.h,
            ),
            Form(
                key: _formKey,
                child: CustomTextFormField(
                  controller: _emailController,
                  label: LocaleKeys.email.tr(),
                  labelTextStyle: Theme.of(context).textTheme.titleSmall,
                  hint: LocaleKeys.enterYourEmail.tr(),
                  hintTextStyle: Theme.of(context).textTheme.titleSmall,
                  validation: (val) => Validator.validateEmail(val),
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                )),
            SizedBox(
              height: 45.h,
            ),
            ValueListenableBuilder(
                valueListenable: isValid,
                builder: (context, value, child) {
                  return CustomButton(
                      label: LocaleKeys.continueWord.tr(),
                      backgroundColor:
                          value ? ColorManager.blue : ColorManager.softGray,
                      onTap: value
                          ? () => Navigator.pushNamed(
                              context, Routes.emailVerification)
                          : () {});
                })
          ],
        ),
      ),
    );
  }
}

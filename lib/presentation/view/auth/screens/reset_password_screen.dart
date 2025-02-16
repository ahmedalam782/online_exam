import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/generated/locale_keys.g.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isValid = false;
  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_validatePasswords);
    _confirmPasswordController.addListener(_validatePasswords);

  }

  void _validatePasswords() {
    setState(() {
      bool passwordValid = Validator.validatePassword(_passwordController.text) == null;
      bool confirmPasswordValid = Validator.validateConfirmPassword(_confirmPasswordController.text, _passwordController.text) == null;
      isValid = passwordValid && confirmPasswordValid;
    });
  }

  @override
  void dispose() {
    _passwordController.removeListener(_validatePasswords);
    _confirmPasswordController.removeListener(_validatePasswords);
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.password.tr())),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
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
                LocaleKeys.resetPasswordParagraph.tr(),
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 18.h,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: _passwordController,
                        label: LocaleKeys.newPassword.tr(),
                        labelTextStyle: Theme.of(context).textTheme.titleSmall,
                        hint: LocaleKeys.enterYourPassword.tr(),
                        hintTextStyle: Theme.of(context).textTheme.titleSmall,
                        validation: Validator.validatePassword,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                      ),
                  SizedBox(
                    height: 30.h ,
                  ),
                      CustomTextFormField(
                        controller: _confirmPasswordController,
                        label: LocaleKeys.confirmPassword.tr(),
                        labelTextStyle: Theme.of(context).textTheme.titleSmall,
                        hint: LocaleKeys.confirmPassword.tr(),
                        hintTextStyle: Theme.of(context).textTheme.titleSmall,
                        validation: (val) => Validator.validateConfirmPassword(
                            val, _passwordController.text),
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ],
                  )),
              SizedBox(
                height: 45.h,
              ),
              CustomButton(
                  label: LocaleKeys.continueWord.tr(),
                  backgroundColor:
                      isValid ? ColorManager.blue : ColorManager.softGray,
                  onTap: () {
                      isValid
                          ? Navigator.pushNamed(context, Routes.login)
                          : null;
                  })
            ],
          ),
        ),
      ),
    );
  }
}

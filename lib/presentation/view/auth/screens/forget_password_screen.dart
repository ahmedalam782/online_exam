import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/resources/color_manager.dart';
import 'package:online_exam/core/resources/values_manager.dart';
import 'package:online_exam/core/utils/validator.dart';
import 'package:online_exam/core/widgets/custom_button.dart';
import 'package:online_exam/core/widgets/custom_text_form_field.dart';
import '../../../../core/routes/routes.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  bool isValid = false;
  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmail);
  }

  void _validateEmail() {
    setState(() {
      isValid = Validator.validateEmail(_emailController.text) == null;
    });
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
      appBar: AppBar(title: Text(BaseLanguage.password)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              BaseLanguage.forgetPassword,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 18.h,
            ),
            Text(
              BaseLanguage.forgetPasswordParagraph,
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
                  label: BaseLanguage.email,
                  labelTextStyle: Theme.of(context).textTheme.titleSmall,
                  hint: BaseLanguage.enterYourEmail,
                  hintTextStyle: Theme.of(context).textTheme.titleSmall,
                  validation: (val) => Validator.validateEmail(val),
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                )),
            SizedBox(
              height: 45.h,
            ),
            CustomButton(
                label: BaseLanguage.continueWord,
                backgroundColor:
                    isValid ? ColorManager.blue : ColorManager.softGray,
                onTap: () {
                  setState(() {
                    isValid
                        ? Navigator.pushNamed(context, Routes.emailVerification )
                        : null;
                  });
                })
          ],
        ),
      ),
    );
  }
}

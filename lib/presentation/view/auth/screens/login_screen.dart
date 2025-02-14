import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:online_exam/presentation/view/auth/screens/sign_up_screen.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/resources/color_manager.dart';
import 'forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool ispress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "login".tr(),
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.blue),
              ),
              SizedBox(height: 40),
              CustomTextFormField(
                controller: _emailController,
                hint: "enterEmail".tr(),
                label: "email".tr(),
                validation: (email) {
                  if (email == null || email.isEmpty) {
                    return "enterEmail".tr();
                  }
                  if (!email.contains('@')) {
                    return "emailValid".tr();
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                controller: _passwordController,
                hint: "enterPassword".tr(),
                label: "password".tr(),
                validation: (password) {
                  if (password == null || password.isEmpty) {
                    return  "enterPassword".tr();
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                      ),
                      Text("Remember me".tr()),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPasswordScreen()),
                      );
                    },
                    child: Text(
                      "forgetPassword".tr(),
                      style: TextStyle(color: ColorManager.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        ispress ? ColorManager.blue : ColorManager.softGray,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        ispress = true;
                      });
                    }
                  },
                  child: Text(
                    "login".tr(),
                    style:
                        TextStyle(fontSize: 18, color: ColorManager.pureWhite),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("don'tHaveAccount".tr()),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text(
                      "signUp".tr(),
                      style: TextStyle(color: ColorManager.blue),
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

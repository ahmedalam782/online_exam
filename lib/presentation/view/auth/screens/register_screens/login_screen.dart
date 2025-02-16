import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/presentation/view/auth/screens/register_screens/sign_up_screen.dart';
import '../../../../../core/di/service_locator.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/ui_utils.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../domain/common/exceptions/server_error.dart';
import '../../../../../domain/entities/auth/sign_in/sign_in_request_entity.dart';

import '../../../../../domain/use_cases/auth/sign_in.dart';
import '../../../../handleErrors/handles_errors.dart';
import '../../../../view_model/cubit/auth/sign_in/sign_In_cubit.dart';
import '../../../../view_model/cubit/auth/sign_in/sign_In_states.dart';
import '../../../../view_model/cubit/auth/sign_in/sign_in_intent.dart';

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
    return BlocProvider(
      create: (context) => SignInCubit(serviceLocator<SignIn>()),
      child: Scaffold(
        body: BlocListener<SignInCubit, SignInStates>(
          listener: (context, state) {
            if (state is SignInLoadingState) {
              UiUtils.showLoadingDialog(context);
            } else if (state is SignInSuccessState) {
              UiUtils.hideLoadingDialog(context);

              print("Token: ${state.signInResponseEntity.token}");

              Navigator.pushReplacementNamed(context, Routes.home);
            }
            else if (state is SignInErrorState) {
              UiUtils.hideLoadingDialog(context);
              if (state.exception is NetworkError) {
                UiUtils.showConnectionDialog(context);
              } else {
                UiUtils.showMessageToast(handleError(state.exception)!);
              }
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
                      color: ColorManager.blue,
                    ),
                  ),
                  const SizedBox(height: 40),
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
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: _passwordController,
                    hint: "enterPassword".tr(),
                    label: "password".tr(),
                    isObscured: ispress,
                    validation: (password) {
                      if (password == null || password.isEmpty) {
                        return "enterPassword".tr();
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
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
                        onPressed: () {},
                        child: Text(
                          "forgetPassword".tr(),
                          style: TextStyle(color: ColorManager.blue),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
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
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            ispress = true;
                          });
                          final cubit = BlocProvider.of<SignInCubit>(context);
                          cubit.doIntent(
                            SignInIntent(
                              signInRequestEntity: SignInRequestEntity(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            ),
                          );
                        }
                      },

                      child: Text(
                        "login".tr(),
                        style: TextStyle(
                          fontSize: 18,
                          color: ColorManager.pureWhite,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("don'tHaveAccount".tr()),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
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
        ),
      ),
    );
  }
}

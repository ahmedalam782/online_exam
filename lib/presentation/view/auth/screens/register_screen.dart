import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/utils/ui_utils.dart';
import 'package:online_exam/core/widgets/custom_app_bar.dart';
import 'package:online_exam/core/widgets/custom_button.dart';
import 'package:online_exam/domain/common/exceptions/server_error.dart';
import 'package:online_exam/domain/entities/auth/sign_up/sign_up_request_entity.dart';
import 'package:online_exam/presentation/handleErrors/handles_errors.dart';
import 'package:online_exam/presentation/view_model/cubit/auth/auth_cubit.dart';
import 'package:online_exam/presentation/view_model/cubit/auth/auth_intent.dart';
import 'package:online_exam/presentation/view_model/cubit/auth/auth_states.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = AuthCubit.get(context);
    return Scaffold(
        appBar: CustomAppBar(
          title: "Sign up",
        ),
        body: Column(
          children: [
            BlocListener<AuthCubit, AuthStates>(
              listener: (context, state) {
                switch (state) {
                  case AuthInitialState():
                    {}
                  case SignUpLoadingState():
                    {
                      UiUtils.showLoadingDialog(context);
                    }
                  case SignUpSuccessState():
                    {
                      UiUtils.hideLoadingDialog(context);
                      print(state.signUpResponseEntity.token);
                    }
                  case SignUpErrorState():
                    {
                      UiUtils.hideLoadingDialog(context);
                      if (state.exception is NetworkError) {
                        UiUtils.showConnectionDialog(context);
                      } else {
                        UiUtils.showMessageToast(handleError(state.exception)!);
                      }
                      // print(handleError(state.exception));
                    }
                }
              },
              child: CustomButton(
                label: 'Sign Up',
                onTap: () {
                  cubit.doIntent(
                    SignUpIntent(
                      signUpRequestEntity: SignUpRequestEntity(
                          username: "ahmedhhh",
                          firstName: "Elevate",
                          lastName: "Tech",
                          email: "admin16666@1elevate.com",
                          password: "Elevate@123",
                          rePassword: "Elevate@123",
                          phone: "01094155711"),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}

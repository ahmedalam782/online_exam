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

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "Login",
        ),
        body: Column());
  }
}

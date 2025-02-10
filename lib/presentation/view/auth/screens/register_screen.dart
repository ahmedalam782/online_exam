import 'package:flutter/material.dart';
import 'package:online_exam/core/widgets/custom_app_bar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Sign up",
      ),
    );
  }
}

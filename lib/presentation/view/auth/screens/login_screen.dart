import 'package:flutter/material.dart';
import 'package:online_exam/core/widgets/custom_app_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "Login",
        ),
        body: Column(
          children: [],
        ));
  }
}

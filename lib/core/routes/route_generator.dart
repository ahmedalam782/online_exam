import 'package:flutter/material.dart';
import 'package:online_exam/core/routes/routes.dart';
import 'package:online_exam/feature/auth/presentation/view/screens/login_screen.dart';
import 'package:online_exam/feature/auth/presentation/view/screens/register_screen.dart';

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen()); 
      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}

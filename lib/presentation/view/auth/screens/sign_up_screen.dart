import 'package:flutter/material.dart';
import 'package:online_exam/presentation/view/auth/screens/login_screen.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/resources/color_manager.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  bool ispress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _userNameController,
                  hint: 'Enter your user name',
                  label: "User name",
                  validation: (userName) {
                    if (userName == null || userName.isEmpty) {
                      return 'Please enter your user name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: _firstNameController,
                        hint: 'Enter your first name',
                        label: "First name",
                        validation: (firstName) {
                          if (firstName == null || firstName.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CustomTextFormField(
                        controller: _lastNameController,
                        hint: 'Enter your last name',
                        label: "Last name",
                        validation: (lastName) {
                          if (lastName == null || lastName.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  controller: _emailController,
                  hint: 'Enter your email',
                  label: "Email",
                  validation: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Please enter your email';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: _passwordController,
                        hint: 'Enter your password',
                        label: "Password",
                        validation: (password) {
                          if (password == null || password.isEmpty) {
                            return 'Please enter your password';
                          } else if (password.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CustomTextFormField(
                        controller: _confirmPasswordController,
                        hint: 'Confirm your password',
                        label: "Confirm password",
                        validation: (confirmPassword) {
                          if (confirmPassword == null ||
                              confirmPassword.isEmpty) {
                            return 'Please confirm your password';
                          } else if (confirmPassword !=
                              _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  controller: _phoneNumberController,
                  hint: 'Enter your phone number',
                  label: "Phone number",
                  validation: (phone) {
                    if (phone == null || phone.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          ispress = true;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          ispress ? ColorManager.blue : ColorManager.softGray,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      "Signup",
                      style: TextStyle(color: ColorManager.pureWhite),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(color: ColorManager.shadowGray),
                        children: [
                          TextSpan(
                            text: "Login",
                            style: TextStyle(
                              color: ColorManager.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}

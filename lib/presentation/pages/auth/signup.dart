import 'package:e_commerce_app/core/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/data/models/auth/user_creation_model.dart';
import 'package:e_commerce_app/presentation/pages/auth/gender_and_age_selection.dart';
import 'package:e_commerce_app/presentation/pages/auth/signin.dart';
import 'package:e_commerce_app/presentation/widgets/app_bar.dart';
import 'package:e_commerce_app/presentation/widgets/basic_app_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(hideBack: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create Account',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(hintText: 'First Name'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(hintText: 'Last Name'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(hintText: 'Email Address'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(height: 20),
            BasicAppButton(
              onPressed: () {
                AppNavigator.push(
                  context,
                  GenderAndAgeSelection(
                    userCreationReq: UserCreationModel(
                      firstName: _firstNameController.text,
                      lastName: _lastNameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  ),
                );
              },
              title: 'Sign Up',
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'Already have an account? '),
                  TextSpan(
                    text: 'Sign In',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        AppNavigator.pushReplacement(context, SignInPage());
                      },
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

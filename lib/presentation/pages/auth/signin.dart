import 'package:e_commerce_app/core/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/presentation/pages/auth/enter_password.dart';
import 'package:e_commerce_app/presentation/pages/auth/signup.dart';
import 'package:e_commerce_app/presentation/widgets/app_bar.dart';
import 'package:e_commerce_app/presentation/widgets/basic_app_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(hideBack: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign In',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(hintText: 'Enter Email'),
            ),
            const SizedBox(height: 20),
            BasicAppButton(
              onPressed: () {
                AppNavigator.push(
                  context,
                  EnterPasswordPage(signInRequest: ""),
                );
              },
              title: 'Sign In',
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: "Don't you have a account? "),
                  TextSpan(
                    text: 'Create one',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        AppNavigator.push(context, SignUpPage());
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

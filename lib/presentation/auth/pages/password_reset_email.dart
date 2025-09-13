import 'package:e_commerce_app/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce_app/core/configs/assets/app_vectors.dart';
import 'package:e_commerce_app/presentation/auth/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordResetEmailPage extends StatelessWidget {
  const PasswordResetEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: SvgPicture.asset(AppVectors.emailSending)),
          const SizedBox(height: 30),
          Center(child: Text("We sent an Email to reset your password.")),
          const SizedBox(height: 30),
          BasicAppButton(
            onPressed: () {
              AppNavigator.pushReplacement(context, SignInPage());
            },
            width: 200,
            title: 'Return to login',
          ),
        ],
      ),
    );
  }
}

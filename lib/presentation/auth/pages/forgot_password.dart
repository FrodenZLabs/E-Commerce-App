import 'package:e_commerce_app/common/bloc/button/button_cubit.dart';
import 'package:e_commerce_app/common/bloc/button/button_state.dart';
import 'package:e_commerce_app/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:e_commerce_app/common/widgets/button/basic_reactive_button.dart';
import 'package:e_commerce_app/presentation/auth/pages/password_reset_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: BlocListener<ButtonCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonFailureState) {
            debugPrint("Failed to change password");
          }

          if (state is ButtonSuccessState) {
            AppNavigator.push(context, PasswordResetEmailPage());
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Password',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: 'Enter Email'),
              ),
              const SizedBox(height: 20),
              BasicReactiveButton(
                onPressed: () {
                  debugPrint("Password changed");
                  AppNavigator.push(context, PasswordResetEmailPage());
                },
                title: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

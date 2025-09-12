import 'package:e_commerce_app/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/core/configs/assets/app_images.dart';
import 'package:e_commerce_app/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app/presentation/auth/pages/signin.dart';
import 'package:e_commerce_app/presentation/home/pages/home.dart';
import 'package:e_commerce_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          AppNavigator.pushReplacement(context, SignInPage());
        }
        if (state is Authenticated) {
          AppNavigator.pushReplacement(context, const HomePage());
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(child: Image.asset(AppImages.appLogo)),
      ),
    );
  }
}

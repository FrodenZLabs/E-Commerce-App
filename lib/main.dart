import 'package:e_commerce_app/core/configs/theme/app_theme.dart';
import 'package:e_commerce_app/core/di/injection.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/presentation/bloc/auth/age_display_cubit.dart';
import 'package:e_commerce_app/presentation/bloc/auth/age_selection_cubit.dart';
import 'package:e_commerce_app/presentation/bloc/auth/gender_selection_cubit.dart';
import 'package:e_commerce_app/presentation/bloc/button/button_cubit.dart';
import 'package:e_commerce_app/presentation/bloc/splash/splash_cubit.dart';
import 'package:e_commerce_app/presentation/pages/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // await seedProducts();
  // await seedCategories();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<SplashCubit>()..appStarted()),
        BlocProvider(create: (context) => getIt<ButtonCubit>()),
        BlocProvider(create: (context) => getIt<GenderSelectionCubit>()),
        BlocProvider(create: (context) => getIt<AgeDisplayCubit>()),
        BlocProvider(create: (context) => getIt<AgeSelectionCubit>()),
      ],
      child: MaterialApp(
        theme: AppTheme.appTheme,
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
      ),
    );
  }
}

import 'package:e_commerce_app/core/configs/theme/app_theme.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/presentation/pages/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => SplashCubit()..appStarted()),
        // BlocProvider(create: (context) => ButtonCubit()),
        // BlocProvider(create: (context) => GenderSelectionCubit()),
        // BlocProvider(create: (context) => AgeSelectionCubit()),
        // BlocProvider(create: (context) => AgeDisplayCubit()),
      ],
      child: MaterialApp(
        theme: AppTheme.appTheme,
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
      ),
    );
  }
}

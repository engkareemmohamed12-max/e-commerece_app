import 'package:e_commerece_app/core/utils/app_routes.dart';
import 'package:e_commerece_app/core/utils/app_theme.dart';
import 'package:e_commerece_app/features/ui/auth/login/login_screen.dart';
import 'package:e_commerece_app/features/ui/auth/register/register_screen.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/di.dart';
import 'core/utils/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.loginRoute,
          routes: {
            AppRoutes.loginRoute: (context) => const LoginScreen(),
            AppRoutes.registerRoute: (context) => const RegisterScreen(),
            AppRoutes.homeRoute: (context) => const HomeScreen(),
          },
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}
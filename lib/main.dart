import 'package:e_commerece_app/core/cache/shared_prefs_utils.dart';
import 'package:e_commerece_app/core/utils/app_routes.dart';
import 'package:e_commerece_app/core/utils/app_theme.dart';
import 'package:e_commerece_app/features/ui/auth/login/login_screen.dart';
import 'package:e_commerece_app/features/ui/auth/register/register_screen.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/home_screen.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/tabs/product_tab/product_details.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/tabs/product_tab/product_screen_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/di.dart';
import 'core/utils/bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await SharedPrefsUtils.init();
  var token = SharedPrefsUtils.getData(key: 'token');
  String routeName ;
  if(token == null){
    // no user => login
    routeName = AppRoutes.loginRoute;
    // user => home
  }else{
    routeName = AppRoutes.homeRoute;
  }
  runApp(MyApp(routeName: routeName,));
}

class MyApp extends StatelessWidget {

  String routeName ;

   MyApp({super.key , required this.routeName});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: routeName,
          routes: {
            AppRoutes.loginRoute: (context) => const LoginScreen(),
            AppRoutes.registerRoute: (context) => const RegisterScreen(),
            AppRoutes.homeRoute: (context) => const HomeScreen(),
            AppRoutes.productDetailsRoute: (context) => const ProductDetails(),
            AppRoutes.productRoute: (context) => const ProductScreenTab(),
          },
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}
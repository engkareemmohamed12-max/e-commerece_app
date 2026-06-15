import 'package:e_commerece_app/core/di/di.dart';
import 'package:e_commerece_app/core/utils/app_routes.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:e_commerece_app/core/utils/dialog_utils.dart';
import 'package:e_commerece_app/features/ui/auth/auth_states.dart';
import 'package:e_commerece_app/features/ui/auth/login/cubit/login_view_model.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordHidden = true;

  final emailController = TextEditingController(text: "kareem2@gmail.com");
  final passwordController = TextEditingController(text: 'Kareemninja12!');
  final formKey = GlobalKey<FormState>();

  void login() {
    if (formKey.currentState!.validate()) {
       viewModel.login(emailController.text, passwordController.text);
    }
  }

  LoginViewModel viewModel = getIt<LoginViewModel>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return BlocListener<LoginViewModel, AuthStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is AuthLoadingState) {
          DialogUtils.showLoading(context: context, loadindMessage: 'Waiting...');
        } else if (state is AuthErrorState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
              context: context,
              message: state.appExceptions.message,
              title: 'Error',
              postName: 'Ok');
        } else if (state is AuthSuccessState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
              context: context,
              message: 'Login Successfully',
              title: 'Success',
              postName: 'Ok' ,
              postAction: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              }
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 24.h,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // شعار Route العلوي
                      Image.asset(
                        AppAssets.loginlogo,
                        height: 71.h,
                        width: 237.w,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 40.h),

                      // نص الترحيب
                      Text(
                        "Welcome Back To Route",
                        style: AppStyles.semi24White
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Please sign in with your mail",
                        style: AppStyles.light16White
                      ),
                      SizedBox(height: 32.h),

                      // حقل اسم المستخدم / الإيميل
                      Text(
                        "E-mail",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      CustomTextField(
                        //cursorColor: figmaBgColor,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "enter your E-mail",
                        hintStyle: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 16.sp,
                        ),

                        controller: emailController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter Email';
                          }
                          final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if (!emailValid) {
                            return 'Please Enter Valid Email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 24.h),

                      // حقل كلمة المرور
                      Text(
                        "Password",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      CustomTextField(
                        //cursorColor: figmaBgColor,
                        keyboardType: TextInputType.visiblePassword,
                        hintText: "enter your password",
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16.sp,
                        ),
                        controller: passwordController,
                        obscureText: isPasswordHidden,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter Password';
                          }
                          if (text.length < 6) {
                            return 'Password Should be at least 6 chars';
                          }
                          return null;
                        },
                        suffixIcons: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordHidden = !isPasswordHidden;
                            });
                          },
                          icon: Icon(
                            isPasswordHidden
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            //color: figmaBgColor, // لون الأيقونة داكن ليظهر على الخلفية البيضاء للحقل
                            size: 22.r,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // نسيت كلمة المرور
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              //todo: navigate to forget password
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Forgot password',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40.h),

                      // زر تسجيل الدخول (أبيض والكتابة باللون الأزرق)
                      CustomElevatedButton(
                        onPressed: login,
                        backgroundColor: Colors.white,
                        verticalPadding: 16.h,
                        child: Text(
                          "Login",
                          style: TextStyle(
                            //color: figmaBgColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),

                      // إنشاء حساب جديد بنفس صياغة الفيجما
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, AppRoutes.registerRoute);
                            },
                            child: Text(
                              "Create Account",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
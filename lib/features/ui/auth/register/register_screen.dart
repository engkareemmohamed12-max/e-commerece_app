import 'package:e_commerece_app/core/di/di.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:e_commerece_app/core/utils/dialog_utils.dart';
import 'package:e_commerece_app/features/ui/auth/auth_states.dart';
import 'package:e_commerece_app/features/ui/auth/login/cubit/login_view_model.dart';
import 'package:e_commerece_app/features/ui/auth/register/cubit/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/custom_text_field.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPasswordHidden = true;
  bool isRePasswordHidden = true;

  final nameController = TextEditingController(text: 'kareem mohamed');
  final phoneController = TextEditingController(text: '01067810248');
  final emailController = TextEditingController(text: "kareem2@gmail.com");
  final passwordController = TextEditingController(text: 'Kareemninja12!');
  final rePasswordController = TextEditingController(text: 'Kareemninja12!');
  final formKey = GlobalKey<FormState>();

  void register() async {
    if (formKey.currentState!.validate()) {
      viewModel.register(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        rePassword: rePasswordController.text,
        phone: phoneController.text,
      );
    }
  }

  RegisterViewModel viewModel = getIt<RegisterViewModel>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, AuthStates>(
      bloc: viewModel,
      listener: (context, state) async {
        if (state is AuthLoadingState) {
          DialogUtils.showLoading(
            context: context,
            loadindMessage: 'Loading...',
          );
        } else if (state is AuthErrorState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
            context: context,
            message: state.appExceptions.message,
            title: 'Error',
            postName: 'Ok',
          );
        } else if (state is AuthSuccessState) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('user_phone', phoneController.text);

          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
            context: context,
            message: 'Register Successfully',
            title: 'Success',
            postName: 'Ok',
            postAction: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
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

                      // حقل اسم المستخدم / الإيميل
                      Text(
                        "Full Name",
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
                        hintText: "enter your name",
                        hintStyle: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 16.sp,
                        ),

                        controller: nameController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter Name';
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 24.h),

                      Text(
                        "Mobile Number",
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
                        hintText: "enter your name",
                        hintStyle: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 16.sp,
                        ),

                        controller: phoneController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter Phone';
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 24.h),
                      Text(
                        "E-mail address",
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
                        hintText: "enter your name",
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
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                          ).hasMatch(text);
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

                      SizedBox(height: 24.h),
                      // حقل كلمة المرور
                      Text(
                        "RePassword",
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
                        controller: rePasswordController,
                        obscureText: isRePasswordHidden,
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
                              isRePasswordHidden = !isRePasswordHidden;
                            });
                          },
                          icon: Icon(
                            isRePasswordHidden
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            //color: figmaBgColor, // لون الأيقونة داكن ليظهر على الخلفية البيضاء للحقل
                            size: 22.r,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),

                      SizedBox(height: 24.h),
                      // زر تسجيل الدخول (أبيض والكتابة باللون الأزرق)
                      CustomElevatedButton(
                        onPressed: register,
                        backgroundColor: Colors.white,
                        verticalPadding: 16.h,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            //color: figmaBgColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
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

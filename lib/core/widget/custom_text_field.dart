import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

typedef OnChanged = void Function(String)?;
typedef OnValidator = String? Function(String?)?;

class CustomTextField extends StatelessWidget {
  final Color? cursorColor;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final Widget? prefixIcons;
  final Widget? suffixIcons;
  final OnChanged onChanged;
  final TextEditingController? controller;
  final int? maxLines;
  final OnValidator validator;
  final bool obscureText;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    this.cursorColor,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.style,
    this.prefixIcons,
    this.suffixIcons,
    this.onChanged,
    this.controller,
    this.maxLines,
    this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: cursorColor,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      style: style ?? const TextStyle(color: Colors.black, fontSize: 16),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.whiteColor,

        enabledBorder: _builtDecorationBorder(radius: 16.r),
        focusedBorder: _builtDecorationBorder(radius: 16.r),

        errorBorder: _builtDecorationBorder(radius: 16.r, borderColor: AppColors.redColor, hasBorder: true),
        focusedErrorBorder: _builtDecorationBorder(radius: 16.r, borderColor: AppColors.redColor, hasBorder: true),

        hintText: hintText,
        hintStyle: hintStyle ?? TextStyle(color: Colors.grey[500], fontSize: 16.sp),
        labelText: labelText,
        labelStyle: labelStyle,
        prefixIcon: prefixIcons,
        suffixIcon: suffixIcons,

        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      ),
      onChanged: onChanged,
      controller: controller,
      validator: validator,
    );
  }

  OutlineInputBorder _builtDecorationBorder({required double radius, Color? borderColor, bool hasBorder = false}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: hasBorder && borderColor != null
          ? BorderSide(color: borderColor, width: 1.5)
          : BorderSide.none,
    );
  }
}
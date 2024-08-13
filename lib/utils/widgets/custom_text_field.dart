import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final TextStyle? labelStyle;
  final TextEditingController controller;
  final EdgeInsets? padding;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? borderRadius;
  final EdgeInsets? margin;
  final int? maxLines;
  final String? Function(String?)? validator;
  final Color? borderColor;
  final Color? focusedBorderColor;

  const CustomTextField({
    super.key,
    this.label,
    this.labelStyle,
    required this.controller,
    this.padding,
    this.hintText,
    this.hintTextStyle,
    this.keyboardType,
    this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.margin,
    this.borderRadius,
    this.maxLines,
    this.validator,
    this.borderColor,
    this.focusedBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label ?? "",
            style: labelStyle ??
                TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF0F172A),
                ),
          ),
          label == null
              ? SizedBox(
                  height: 0.h,
                  // child: Text("data"),
                )
              : SizedBox(
                  height: 8.h,
                ),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText ?? false,
            maxLines: maxLines ?? 1,
            validator: validator,
            decoration: InputDecoration(
              contentPadding: padding ??
                  EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 12.w,
                  ),
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF94A3B8),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 6.r),
                borderSide: BorderSide(
                  color: GlobalColors.borderColor,
                  width: 1.w,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 6.r),
                borderSide: BorderSide(
                  color: borderColor ?? GlobalColors.borderColor,
                  width: 1.w,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 6.r),
                borderSide: BorderSide(
                  color: focusedBorderColor ?? GlobalColors.orange,
                  width: 1.w,
                ),
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ),
          ),
        ],
      ),
    );
  }
}

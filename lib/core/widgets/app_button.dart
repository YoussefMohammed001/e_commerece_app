import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  AppButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.borderRadius,
    this.margin,
    this.padding,
    this.textColor = Colors.white,
    this.bgColor,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final Color textColor;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 30.sp),
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(bgColor),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(side: const BorderSide(color: AppColors.success),
              borderRadius: borderRadius ?? BorderRadius.circular(20.sp),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: padding ?? EdgeInsets.symmetric(vertical: 15.sp),
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}

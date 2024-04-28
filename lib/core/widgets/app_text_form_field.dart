import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppTextFormField extends StatefulWidget {
 const  AppTextFormField({super.key, required this.labelText,
   required this.textInputAction,
   required this.keyboardType,
   this.validators, required this.controller,
   required this.prefixIcon, required this.isPass,
    this.isEnabled = true,  this.search = false,});
  final TextEditingController controller;
  final String labelText;
  final TextInputAction textInputAction;
  final  TextInputType keyboardType;
  final FormFieldValidator<String>? validators;
  final IconData prefixIcon;
  final bool isPass;
  final bool search;
final bool isEnabled;

 @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        TextFormField(
          enabled: widget.isEnabled,
          obscureText: obscureText,
          validator: widget.validators,
          controller: widget.controller,
          textInputAction: widget.textInputAction ,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            prefixIcon:  widget.search ?  const AppSVG(
              assetName: "search",
              boxFit: BoxFit.none,
            ) : null,
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.sp),
              borderSide:   const BorderSide(color: AppColors.error),

            ),
            errorStyle: const TextStyle(color:AppColors.error),
            contentPadding: EdgeInsets.symmetric(horizontal: 15.sp),
            focusColor: AppColors.primary,
            fillColor: Colors.grey[100],
              hintText: widget.labelText,
            hintStyle: const TextStyle(color:  AppColors.grey),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.sp),
                borderSide:  BorderSide(color: Colors.grey.shade400),

              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.sp),
                borderSide:  BorderSide(color: Colors.grey.shade400),

              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.sp),
                borderSide:  const BorderSide(color: AppColors.error),

              ),
                suffixIcon: Visibility(
                visible:  widget.isPass == true,
                child: IconButton(onPressed: () {
                  obscureText = !obscureText;
                  setState(() {

                  });

                }, icon:  Icon(obscureText == true ? Icons.visibility_off_outlined : Icons.visibility_outlined,color: AppColors.primary,),),
              ),
              focusedBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.sp),
                  borderSide: const BorderSide(color: AppColors.primary),

              ),
          ),

        ),
      ],
    );
  }
}
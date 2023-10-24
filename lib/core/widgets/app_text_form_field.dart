import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
   AppTextFormField({super.key, required this.labelText, required this.textInputAction, required this.keyboardType, this.validators, required this.controller,required this.prefixIcon, required this.isPass});
final TextEditingController controller;
final String labelText;
   final TextInputAction textInputAction;
final  TextInputType keyboardType;
   final FormFieldValidator<String>? validators;
final IconData prefixIcon;
final bool isPass;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
bool obscureText = false;

   @override
  Widget build(BuildContext context) {
    return    TextFormField(
      obscureText: obscureText,
      validator: widget.validators,
controller: widget.controller,
      textInputAction: widget.textInputAction ,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(color:  AppColors.primary),
          border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primary)),
          prefixIcon: Icon(widget.prefixIcon,color: AppColors.primary,),
          disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primary)),
          suffixIcon: Visibility(
            visible:  widget.isPass == true,
            child: IconButton(onPressed: () {
              obscureText = !obscureText;
              setState(() {

              });

            }, icon:  Icon(obscureText == true ? Icons.visibility_off_outlined : Icons.visibility_outlined,color: AppColors.primary,),),
          ),
          focusColor: AppColors.primary,
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primary))

      ),

    );
  }
}

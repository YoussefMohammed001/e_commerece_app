import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/widgets/app_button.dart';
import 'package:e_commerece_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddressDialogue extends StatelessWidget {
  AddressDialogue(
      {super.key,
      required this.name,
      required this.region,
      required this.city,
      required this.details,
      required this.note, required this.title, required this.onTap});
  final TextEditingController name;
  final TextEditingController region;
  final TextEditingController city;
  final TextEditingController details;
  final TextEditingController note;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      scrollable: true,
      actions: [
          SizedBox(height: 3.h,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp,
              color: AppColors.primary
              ),),
            ],
          ),
          SizedBox(height: 3.h,),
          AppTextFormField(
            labelText: 'Name',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            controller: name,
            prefixIcon: Icons.person_outline,
            isPass: false,
          ),
          SizedBox(height: 3.h,),
          AppTextFormField(
            labelText: 'City',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            controller: city,
            prefixIcon: Icons.location_city_sharp,
            isPass: false,
          ),
          SizedBox(height: 3.h,),
          AppTextFormField(
            labelText: 'Region',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            controller: region,
            prefixIcon: Icons.place_outlined,
            isPass: false,
          ),
          SizedBox(height: 3.h,),

          AppTextFormField(
            labelText: 'Details',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            controller: details,
            prefixIcon: Icons.details,
            isPass: false,
          ),
          SizedBox(height: 3.h,),
          AppTextFormField(
            labelText: 'Note',

            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            controller: note,
            prefixIcon: Icons.note_alt_outlined,
            isPass: false,
          ),
          SizedBox(height: 3.h,),
          AppButton(onPressed: onTap, label: title,
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(13.sp),
          bgColor: AppColors.primary.withOpacity(0.7),),
      ],
    );
  }
}

import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/svg.dart';
import 'package:e_commerece_app/core/widgets/app_button.dart';
import 'package:e_commerece_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SaveAddressChangingWidget extends StatelessWidget {
  const SaveAddressChangingWidget({super.key, this.value, this.onChanged});
  final bool? value;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.sp),
          child: Divider(
            height: 1.h,
            color: AppColors.grey,
            thickness: 7.sp,
          ),
        ),
        Gap(2.h),

        Row(
          children: [
            Text(
              'Address Details',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            InkWell(
                onTap: () => pop(context),
                child: AppSVG(
                  assetName: 'close',
                  width: 20.sp,
                  height: 20.sp,
                ))
          ],
        ),
        Gap(1.h),
        Row(
          children: [
            const AppSVG(
              assetName: 'location',
              color: Colors.green,
            ),
            Gap(3.w),
            Text(
              '1-5, El Gabalaya St, Zamalek, Cairo',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        Gap(2.h),
        Text(
          'Address Labels',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        AppTextFormField(
            labelText: 'Label',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            controller: TextEditingController(),
            prefixIcon: Icons.abc,
            isPass: false),
        Gap(2.h),
        Text(
          'Note to Courier ( Optional )',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        AppTextFormField(
            labelText: 'Note',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            controller: TextEditingController(),
            prefixIcon: Icons.abc,
            isPass: false),
        Gap(0.5.h),
        Row(
          children: [
            Checkbox(
              activeColor: AppColors.success,
              shape: const CircleBorder(
                  side: BorderSide(style: BorderStyle.solid)),
              value: value,
              onChanged: onChanged
            ),
            Text(
              'Set as Primary Address',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
        Gap(1.h),
        AppButton(onPressed: () {
        }, label: 'Save', textColor: Colors.white,bgColor: AppColors.success,margin: EdgeInsets.symmetric(horizontal: 1.sp),),
        Gap(1.h),

      ],
    );
  }
}

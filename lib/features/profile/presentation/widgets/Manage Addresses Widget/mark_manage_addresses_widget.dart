import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MarkManageAddressesWidget extends StatelessWidget {
  const MarkManageAddressesWidget({super.key, required this.markLocation, required this.visibility});

  final String markLocation;
  final bool visibility;
  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        Text(
          markLocation,
          style: TextStyle(
              color: AppColors.dark,
              fontWeight: FontWeight.bold,
              fontSize: 17.sp),
        ),
        Gap(3.w),
        Visibility(
          visible: visibility,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: 15.sp, vertical: 12.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: AppColors.success, width: 0.4.w),
              borderRadius: BorderRadius.circular(12.sp),
            ),
            child: Text(
              'Main Address',
              style: TextStyle(
                  color: AppColors.dark,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp),
            ),
          ),
        ),
        const Spacer(),
        AppSVG(
          assetName: 'share',
          width: 22.sp,
          height: 22.sp,
        ),
      ],
    );
  }
}

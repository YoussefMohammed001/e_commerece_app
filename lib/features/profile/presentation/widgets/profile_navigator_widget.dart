import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileNavigatorWidget extends StatelessWidget {
  const ProfileNavigatorWidget({super.key, required this.titleDetector, required this.pushTo,  this.titleColor = AppColors.dark, required this.svgName, this.iconColor  = AppColors.dark, this.svgColor = AppColors.dark});

  final String titleDetector;
  final String svgName;
  final VoidCallback pushTo;
  final Color? titleColor ;
  final Color? iconColor ;
  final Color? svgColor ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pushTo ,
      child: Row(
        children: [
          AppSVG(assetName: svgName,color: svgColor,),
          SizedBox(
            width: 5.w,
          ),
          Text(
            titleDetector,
            style: TextStyle(fontSize: 17.sp, color: titleColor,fontWeight: FontWeight.w500),
          ),
          const Spacer(),
           Icon(
            Icons.navigate_next_rounded,
            color: iconColor,size: 3.6.h,
          )
        ],
      ),
    );
  }
}

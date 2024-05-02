import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AccountAndSecurityItem extends StatelessWidget {
  const AccountAndSecurityItem({super.key, required this.mainTitle, required this.titleDescription, required this.pushClick, this.mainTitleColor = AppColors.dark, required this.checkVisibility});

  final String mainTitle;
  final String titleDescription;
  final VoidCallback pushClick;
  final Color? mainTitleColor;
  final bool checkVisibility;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pushClick,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  mainTitle,
                  style: TextStyle(
                      color: mainTitleColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Gap(0.7.h),
                Visibility(
                  visible: checkVisibility,
                  child: Text(
                    titleDescription,
                    style: TextStyle(
                        color: AppColors.dark,
                        fontSize: 15.sp),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Icon(Icons.arrow_forward_ios_rounded,color: AppColors.dark,size: 2.h,)
        ],
      ),
    )
    ;
  }
}

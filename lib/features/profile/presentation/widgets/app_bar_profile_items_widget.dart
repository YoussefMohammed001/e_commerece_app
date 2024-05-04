import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class AppBarProfileItemsWidget extends StatelessWidget {
  const AppBarProfileItemsWidget({super.key, required this.title,  this.rightIcon, required this.leftIcon,  this.onAdd, this.iconVisibility = true});

  final String title;
  final String? rightIcon;
  final String leftIcon;
  final VoidCallback? onAdd;
  final bool iconVisibility;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () => pop(context),
            child: AppSVG(assetName: leftIcon,width: 22.sp,height: 22.sp,)),
        Expanded(
          child: Center(
              child: Text(
                title,
                style: TextStyle(
                    color: AppColors.dark,
                    fontWeight: FontWeight.bold,
                    fontSize: 19.sp),
              )),
        ),
        iconVisibility ?       InkWell(
          onTap: onAdd,
            child: AppSVG(assetName: rightIcon!,width: 22.sp,height: 22.sp,)) : const SizedBox(),

      ],
    );
  }
}

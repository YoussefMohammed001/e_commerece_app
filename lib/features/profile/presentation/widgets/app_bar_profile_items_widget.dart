import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class AppBarProfileItemsWidget extends StatelessWidget {
  const AppBarProfileItemsWidget({super.key, required this.title, required this.rightIcon, required this.liftIcon, required this.onAdd});

  final String title;
  final String rightIcon;
  final String liftIcon;
  final VoidCallback onAdd;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () => pop(context),
            child: AppSVG(assetName: liftIcon,width: 22.sp,height: 22.sp,)),
        const Spacer(),
        Center(
            child: Text(
              title,
              style: TextStyle(
                  color: AppColors.dark,
                  fontWeight: FontWeight.bold,
                  fontSize: 19.sp),
            )),
        const Spacer(),
        InkWell(
          onTap: onAdd,
            child: AppSVG(assetName: rightIcon,width: 22.sp,height: 22.sp,)),

      ],
    );
  }
}

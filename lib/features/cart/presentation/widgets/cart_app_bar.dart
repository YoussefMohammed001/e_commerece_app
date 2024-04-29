import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return    Container(
      margin: EdgeInsets.all(14.sp),
      child: Row(

        children: [


          InkWell(
            onTap: () => pop(context),
            child: const Icon(Icons.arrow_back_ios,
              color: AppColors.dark,
            ),
          ),
          Text("Your Cart",
            style: TextStyle(
              fontSize: 17.sp,
              color: AppColors.dark,
              fontWeight: FontWeight.w500,

            ),
          ),

        ],
      ),
    );
  }
}

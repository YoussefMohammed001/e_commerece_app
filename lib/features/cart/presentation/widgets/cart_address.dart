import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartAddress extends StatelessWidget {
  const CartAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Container(
          margin: EdgeInsets.all(12.sp),
          child: Row(
            children: [
              Expanded(
                child: Text("Delever to",style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColors.grey,

                ),),
              ),
              Text("Cairo, Egypt",
                style: TextStyle(
                  color: AppColors.dark,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
              const Icon(Icons.keyboard_arrow_down_outlined),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}

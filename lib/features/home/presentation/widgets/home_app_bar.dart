import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar(
      {super.key, required this.title, required this.notifications, required this.cart});

  final String title;
  final int notifications;
  final int cart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
      },
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Delivery Address",
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 15.sp
                    ),
                    ),
                    Row(
                      children: [
                        Text("Cairo, Egypt",
                        style: TextStyle(
                          color: AppColors.dark,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                        ),
                        Icon(Icons.keyboard_arrow_down_outlined)
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.sp,
                horizontal: 11.sp
                ),
                // decoration: BoxDecoration(
                //   color: AppColors.primary,
                //   borderRadius: BorderRadius.circular(12.sp)
                // ),
                child: AppSVG(assetName: "cart"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

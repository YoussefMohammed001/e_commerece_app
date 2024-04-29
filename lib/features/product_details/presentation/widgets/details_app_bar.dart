import 'dart:async';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/svg.dart';
import 'package:e_commerece_app/features/cart/presentation/pages/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailsAppBar extends StatefulWidget {
  const DetailsAppBar({super.key, required this.product,});
final String product;

  @override
  State<DetailsAppBar> createState() => _DetailsAppBarState();
}

class _DetailsAppBarState extends State<DetailsAppBar> {





  @override
  Widget build(BuildContext context) {
    return       Padding(
      padding: EdgeInsets.all(12.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => pop(context),
            child: const Icon(
                  Icons.arrow_back_ios_sharp,
                  color: AppColors.dark,
                ),
          ),
          InkWell(
            onTap: () {
              push(context, const CartScreen());
            },
            child: const AppSVG(assetName: "cart"),
          ),
        ],
      ),
    );
  }
}

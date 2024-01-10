import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({super.key, required this.product});
final String product;
  @override
  Widget build(BuildContext context) {
    return       Padding(
      padding: EdgeInsets.only(top: 20.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                color: AppColors.primary,
              )),
          Expanded(
            child: Text(

              product,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                overflow:  TextOverflow.ellipsis
              ),
            ),
          ),
          IconButton(
              onPressed: () {
               // pushAndRemoveUntil(context, CartScreen());
              },

              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: AppColors.primary,
              )),
        ],
      ),
    );
  }
}

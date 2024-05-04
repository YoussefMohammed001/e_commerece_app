import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PricingDetailsWidget extends StatelessWidget {
  const PricingDetailsWidget({super.key, required this.totalQuantity, required this.subTotal, required this.total, required this.onPress,});
  final String totalQuantity;
  final String subTotal;
  final String total;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Quantity:',
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              totalQuantity,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal:',
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              subTotal,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'VAT',
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '14%',
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total:',
              style: TextStyle(
                //color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              total,
              style: TextStyle(
                // color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        AppButton(
          onPressed: onPress,
          borderRadius: BorderRadius.circular(13.sp),
          bgColor: AppColors.primary,
          margin: EdgeInsets.symmetric(
            vertical: 13.sp,
          ),
          label: 'Done',

        ),
      ],
    );
  }
}

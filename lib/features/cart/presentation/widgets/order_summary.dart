import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key, required this.totalPrice, required this.quantity, required this.pressCheckOut});
final int totalPrice;
final int quantity;
final VoidCallback pressCheckOut;
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.all(14.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          Text(
            "Order summary",
            style: TextStyle(
              color: AppColors.dark,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ),
          Row(
            children: [
              const Text(
                "Total products",
                style: TextStyle(
                  color: AppColors.dark,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                quantity.toString()
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                "Price",
                style: TextStyle(
                  color: AppColors.dark,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Container(
                  child: Text(
                      "${totalPrice} EGP")),
            ],
          ),
          Row(
            children: [
              const Text(
                "VAT",
                style: TextStyle(
                  color: AppColors.dark,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Container(child: const Text("14 %")),
            ],
          ),
          Row(
            children: [
              const Text(
                "Total price",
                style: TextStyle(
                  color: AppColors.dark,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Container(
                  child: Text(
                      "${(14 / 100 * totalPrice) + totalPrice} EGP")),
            ],
          ),
          AppButton(
              bgColor: AppColors.primary,
              borderRadius: BorderRadius.circular(14.sp),
              padding: EdgeInsets.all(12.sp),
              margin: EdgeInsets.all(15.sp),
              onPressed: pressCheckOut,
              label: "Check Out"),
        ],
      ),
    );
  }
}

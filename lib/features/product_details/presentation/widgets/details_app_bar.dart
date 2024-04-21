import 'dart:async';

import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/features/cart/presentation/pages/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailsAppBar extends StatefulWidget {
  const DetailsAppBar({super.key, required this.product});
final String product;

  @override
  State<DetailsAppBar> createState() => _DetailsAppBarState();
}

class _DetailsAppBarState extends State<DetailsAppBar> {
late Timer timer;

@override
  void dispose() {
  timer.cancel();
  // TODO: implement dispose
    super.dispose();
  }
double dimension = 5;

@override
  void initState() {
    super.initState();
    timer =  Timer.periodic(const Duration(milliseconds: 800), (timer) {
      setState(() {
        dimension = dimension == 5 ? 6 : 5;

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return       Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          child: IconButton(
              onPressed: () {
                pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                color: AppColors.primary,
              )),
        ),
        AnimatedContainer(

          duration: const Duration(milliseconds: 500),
          height:dimension.h,
          width: dimension.h,
          child: CircleAvatar(
            child: IconButton(
                onPressed: () {
               pushAndRemoveUntil(context, const CartScreen());
                },

                icon: const Icon(
                  Icons.shopping_cart_outlined,

                  color: AppColors.primary,
                )),
          ),
        ),
      ],
    );
  }
}

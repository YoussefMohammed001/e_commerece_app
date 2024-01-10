import 'package:e_commerece_app/core/shared/my_shared.dart';
import 'package:e_commerece_app/core/shared/my_shared_keys.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/svg.dart';
import 'package:e_commerece_app/features/cart/presentation/pages/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar(
      {super.key, required this.title, required this.notifications, required this.cart});

  final String title;
  final int notifications;
  final int cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 18.sp),
      color: AppColors.primary,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        child: Row(
          children: [
            SizedBox(width: 2.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome,",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            color: Colors.white
                        ),
                      ),
                      Text(
                        MyShared.getString(key: MySharedKeys.username),
                        style: TextStyle(fontSize: 18.sp, color: Colors.white,),
                      ),
                    ],
                  ),
                ),
                Text(
                  "What would you like to buy today?",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold, fontSize: 13.sp),
                ),


              ],
            ),

            const Spacer(),

            // Stack(
            //   alignment: AlignmentDirectional.bottomEnd,
            //   children: [
            //     const AppSVG(assetName: 'notifications',)
            //   ],
            // ),
            // SizedBox(width: 3.w,),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [

                InkWell(
                    onTap: () {
                      push(context, CartScreen());
                    },
                    child: const AppSVG(assetName: 'cart',)),
                Visibility(
                  visible: cart > 0,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CircleAvatar(
                        radius: 11.sp,
                        backgroundColor: Colors.white,
                      ),
                      Text(cart.toString(), style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold),),
                    ],
                  ),
                )
              ],
            ),


          ],
        ),
      ),
    );
  }
}

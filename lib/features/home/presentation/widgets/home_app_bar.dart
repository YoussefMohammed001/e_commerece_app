import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/features/cart/presentation/pages/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.title, required this.notifications, required this.cart});
final String title;
final int notifications;
final int cart;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical:20.sp,horizontal: 15.sp),
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
                        "Youssef",
                        style: TextStyle(fontSize: 18.sp,    color: Colors.white,),
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
            
            Spacer(),
            
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
               notifications > 0 ? Icon(Icons.notifications_active_outlined,color: Colors.white,size: 23.sp,): Icon(Icons.notifications_none,color: Colors.white,),
                Visibility(
                  visible: notifications> 0,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CircleAvatar(
                        radius: 11.sp,
                        backgroundColor: Colors.white,
                      ),
                      Text(notifications.toString(),style: TextStyle(color:AppColors.primary,fontWeight: FontWeight.bold),),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(width: 3.w,),
     Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [

            InkWell(
                onTap: (){
                  push(context, CartScreen());
                },
                child: Icon(Icons.shopping_cart_outlined,color: Colors.white,)),
                Visibility(
                  visible: cart> 0,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CircleAvatar(
                        radius: 11.sp,
                        backgroundColor: Colors.white,
                      ),
                      Text(cart.toString(),style: TextStyle(color:AppColors.primary,fontWeight: FontWeight.bold),),
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

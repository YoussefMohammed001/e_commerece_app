import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/widgets/app_image.dart';
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
        padding: EdgeInsets.all(8.sp),
        child: Row(
          children: [
            AppImage(
              imageUrl:
              'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=800&q=60',
              width: 27.sp,
              height: 27.sp,
              topLeftRadius: 25.sp,
              topRightRadius: 25.sp,
              bottomLeftRadius: 25.sp,
              bottomRightRadius: 25.sp,
            ),
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
                cart > 0 ? Icon(Icons.shopping_cart_outlined,color: Colors.white,size: 23.sp,): Icon(Icons.shopping_cart_outlined,color: Colors.white,),
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

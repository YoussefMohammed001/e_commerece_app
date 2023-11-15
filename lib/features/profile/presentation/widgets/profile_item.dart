import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.icon, required this.text, required this.onPress});
final IconData icon;
final String text;
final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return     InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(12.sp),
        padding: EdgeInsets.all(18.sp),
        decoration: BoxDecoration(
          color: Colors.amber[100],
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Row(
          children: [
            Icon(icon,color: AppColors.primary,),
            SizedBox(width: 3.w,),
            Text(text,style:const TextStyle(fontWeight: FontWeight.bold,color: AppColors.primary),),
            Spacer(),
            Container(
              padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                  color: Colors.amber[200],
                  borderRadius: BorderRadius.circular(30.sp),
                ),
                child: Icon(Icons.navigate_next_rounded,color: AppColors.primary,)),
          ],
        ),
      ),
    );
  }
}

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
        margin: EdgeInsets.symmetric(horizontal: 12.sp,vertical: 14.sp),
        padding: EdgeInsets.symmetric(horizontal: 16.sp,vertical: 16.sp),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Row(
          children: [
            Text(text,style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.dark,fontSize: 16.sp),),
            Spacer(),
            Container(
              padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(30.sp),
                ),
                child: Icon(Icons.navigate_next_rounded,color: AppColors.primary,)),
          ],
        ),
      ),
    );
  }
}

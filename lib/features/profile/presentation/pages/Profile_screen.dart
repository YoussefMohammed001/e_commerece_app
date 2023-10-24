import 'package:e_commerece_app/core/shared/my_shared.dart';
import 'package:e_commerece_app/core/shared/my_shared_keys.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/features/profile/presentation/widgets/log_out_iitem.dart';
import 'package:e_commerece_app/features/profile/presentation/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.all(15.sp),
            width: double.infinity,
            color: AppColors.primary,
            child: Center(
                child: Text(
              "Profile",
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ))),
        Container(
          margin: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              Text(
                MyShared.getString(key: MySharedKeys.username),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                MyShared.getString(key: MySharedKeys.email),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                height: 18.sp,
              ),
              Container(
                padding: EdgeInsets.only(
                  bottom: 0.1.sp, // Space between underline and text
                ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: AppColors.primary,
                  width: 6.sp, // Underline thickness
                ))),
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              const ProfileItem(
                icon: Icons.edit_outlined,
                text: 'Edit Profile',
              ),
              const ProfileItem(
                icon: Icons.settings,
                text: 'Settings',
              ),
              const ProfileItem(
                icon: Icons.favorite_outline,
                text: 'Saved Items',
              ),
              const ProfileItem(
                icon: Icons.shopping_cart_checkout_sharp,
                text: 'Orders',
              ),
              SizedBox(
                height: 3.h,
              ),
              const LogOutItem(),
            ],
          ),
        ),
      ],
    );
  }
}

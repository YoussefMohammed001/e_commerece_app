import 'package:e_commerece_app/core/shared/my_shared.dart';
import 'package:e_commerece_app/core/shared/my_shared_keys.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/features/profile/presentation/pages/settings_screen.dart';
import 'package:e_commerece_app/features/profile/presentation/pages/update_profile_screen.dart';
import 'package:e_commerece_app/features/profile/presentation/widgets/log_out_iitem.dart';
import 'package:e_commerece_app/features/profile/presentation/widgets/profile_item.dart';
import 'package:e_commerece_app/features/saved_items/presentation/pages/fav_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(bottom: 18.sp),
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
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                MyShared.getString(key: MySharedKeys.email),
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                height: 18.sp,
              ),

               ProfileItem(
                icon: Icons.edit_outlined,
                text: 'Edit Profile', onPress: () {
                  push(context, UpdateProfileScreen());
               },
              ),
               ProfileItem(
                icon: Icons.settings,
                text: 'Settings', onPress: () {
                  push(context, const NewsSettingsScreen());
               },
              ),
               ProfileItem(
                icon: Icons.favorite_outline,
                text: 'Saved Items', onPress: () {

                 push(context, const FavScreen());

               },
              ),
              //  ProfileItem(
              //   icon: Icons.shopping_cart_checkout_sharp,
              //   text: 'Orders', onPress: () {
              //     push(context, const OrdersScreen());
              //
              //  },
              // ),
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

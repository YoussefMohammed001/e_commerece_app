import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerece_app/core/shared/my_shared.dart';
import 'package:e_commerece_app/core/shared/my_shared_keys.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/svg.dart';
import 'package:e_commerece_app/features/Account%20&%20Security/Presentation/Screen/account_&_security.dart';
import 'package:e_commerece_app/features/App%20Appearance/presentation/pages/app_appearance.dart';
import 'package:e_commerece_app/features/add_complaint/presentation/pages/add_complaint_screen.dart';
import 'package:e_commerece_app/features/address/presentation/pages/manage_addresses_screen.dart';
import 'package:e_commerece_app/features/faqs/view/screens/faqs_screen.dart';
import 'package:e_commerece_app/features/orders/presentation/pages/orders.dart';
import 'package:e_commerece_app/features/profile/presentation/widgets/profile_navigator_widget.dart';
import 'package:e_commerece_app/features/terms_and_conditions/view/screens/terms_and_conditions_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AppSVG(assetName: 'shop',width: 22.sp,height: 22.sp,),
                const Spacer(),
                Center(
                    child: Text(
                  "Account",
                  style: TextStyle(
                      color: AppColors.dark,
                      fontWeight: FontWeight.bold,
                      fontSize: 19.sp),
                )),
                const Spacer(),
                AppSVG(assetName: 'qrCode',width: 22.sp,height: 22.sp,),
              ],
            ),
            Gap(20.sp),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.sp),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25.sp,
                    backgroundImage: CachedNetworkImageProvider(
                      "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600",
                      errorListener: (p0) => const Icon(Icons.error),
                    ),
                  ),
                  Gap(3.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        MyShared.getString(key: MySharedKeys.username),
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.dark),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        MyShared.getString(key: MySharedKeys.email),
                        style:
                            TextStyle(fontSize: 17.sp, color: AppColors.dark),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Gap(4.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.sp),
              ),
              child: Column(
                children: [

                  ProfileNavigatorWidget(
                    titleDetector: 'Manage Addresses',
                    pushTo: () {
                      push(context,  ManageAddressesScreen());
                    },
                    svgName: 'location',
                  ),
                  Gap(3.h),
                  ProfileNavigatorWidget(
                    titleDetector: 'Payment Methods',
                    pushTo: () {
                    },
                    svgName: 'paymentCard',
                  ),
                  Gap(3.h),
                  ProfileNavigatorWidget(
                    titleDetector: 'Account & Security',
                    pushTo: () {
                      push(context, const AccountAndSecurity());
                    },
                    svgName: 'security',
                  ),
                ],
              ),
            ),
            Gap(2.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.sp),
              ),
              child: Column(
                children: [
                  ProfileNavigatorWidget(
                    titleDetector: 'My Profile',
                    pushTo: () {},
                    svgName: 'profile',
                  ),
                  Gap(3.h),
                  ProfileNavigatorWidget(
                    titleDetector: 'Notifications',
                    pushTo: () {},
                    svgName: 'notification',
                  ),
                  Gap(3.h),
                  ProfileNavigatorWidget(
                    titleDetector: 'App Appearance',
                    pushTo: () {
                      push(context,  AppAppearance());
                    },

                    svgName: 'eye',
                  ),   Gap(3.h),
                  ProfileNavigatorWidget(
                    titleDetector: 'FAQS',
                    pushTo: () {
                      push(context, FAQsScreen());
                    },

                    svgName: 'help',
                  ),
                  Gap(3.h),
                  ProfileNavigatorWidget(
                    titleDetector: 'Send Complaint',
                    pushTo: () {
                      push(context, const AddComplaintScreen());
                    },
                    svgName: 'complaint',
                  ),
                  Gap(3.h),
                  ProfileNavigatorWidget(
                    titleDetector: 'Terms & Conditions',
                    pushTo: () {
                      push(context, TermsAndConditionsScreen());
                    },
                    svgName: 'terms',
                  ),
                  Gap(3.h),
                  ProfileNavigatorWidget(
                    titleDetector: 'Log Out',
                    pushTo: () {
                      push(context, OrdersScreen());
                    },
                    titleColor: AppColors.error,
                    svgName: 'logout',
                    iconColor: AppColors.error,
                    svgColor: AppColors.error,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}

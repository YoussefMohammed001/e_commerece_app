import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/Account%20&%20Security/Presentation/Widget/account_&_security_items.dart';
import 'package:e_commerece_app/features/change_password/presentation/pages/change_pass_screen.dart';
import 'package:e_commerece_app/features/profile/presentation/widgets/app_bar_profile_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AccountAndSecurity extends StatefulWidget {
  const AccountAndSecurity({super.key});

  @override
  State<AccountAndSecurity> createState() => _AccountAndSecurityState();
}

class _AccountAndSecurityState extends State<AccountAndSecurity> {
  bool changeSwitch = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.bg,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
        child: Column(
          children: [
            AppBarProfileItemsWidget(
              title: 'Account & Security',
              rightIcon: 'add',
              leftIcon: 'arrow',iconVisibility: false,
              onAdd: ()  {},
            ),
            Gap(3.h),
            Row(
              children: [
                Text(
                 'Face ID' ,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Switch(
                  activeColor: AppColors.success,

                  onChanged: (value) {
                 setState(() {
                   changeSwitch = value;
                   safePrint(changeSwitch);
                   safePrint(value);
                 });
                }, value: changeSwitch,

                )
              ],
            ),
            Gap(3.h),
            AccountAndSecurityItem(
              mainTitle: 'Change password',
              titleDescription:
                   '',
              pushClick: () {
                push(context, ChangePassScreen());
              }, checkVisibility: false,
            ),
            Gap(3.h),
            AccountAndSecurityItem(
              mainTitle: 'Deactivate account',
              titleDescription:
                  'Temporary deactivate your account Easily reactivate when you ready ',
              pushClick: () {}, checkVisibility: true,
            ),
            Gap(3.h),
            AccountAndSecurityItem(
              mainTitleColor: AppColors.error,
              mainTitle: 'Delete account',
              titleDescription:
                  'Permanently remove your account and data. \nProceed with caution. ',
              pushClick: () {}, checkVisibility: true,
            ),
          ],
        ),
      ),
    ));
  }
}

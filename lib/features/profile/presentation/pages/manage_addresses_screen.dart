import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/features/profile/presentation/widgets/Manage%20Addresses%20Widget/manage_addresses_widget.dart';
import 'package:e_commerece_app/features/profile/presentation/widgets/app_bar_profile_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ManageAddressesScreen extends StatelessWidget {
  const ManageAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bg,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
          child: Column(
            children: [
              const AppBarProfileItemsWidget(
                  title: 'Manage Addresses',
                  rightIcon: 'add',
                  liftIcon: 'arrow'),
              Gap(3.h),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) =>   ManageAddressesWidget(markLocation: 'Home', visibility: false, name: 'Moaz Muhammed', phone: '+20 1022741849', address: '1-5, El Gabalaya St, Zamalek, Cairo',)
                  ,),
              )
            ],
          ),
        ),
      ),
    );
  }
}

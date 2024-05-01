import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/svg.dart';
import 'package:e_commerece_app/core/widgets/app_button.dart';
import 'package:e_commerece_app/features/profile/presentation/widgets/Manage%20Addresses%20Widget/changing_address_bottom_sheet_widget.dart';
import 'package:e_commerece_app/features/profile/presentation/widgets/Manage%20Addresses%20Widget/mark_manage_addresses_widget.dart';
import 'package:e_commerece_app/features/profile/presentation/widgets/Manage%20Addresses%20Widget/save_address_changeing_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ManageAddressesWidget extends StatefulWidget {
  const ManageAddressesWidget(
      {super.key,
      required this.markLocation,
      required this.visibility,
      required this.name,
      required this.phone,
      required this.address});

  final String markLocation;
  final String name;
  final String phone;
  final String address;
  final bool visibility;

  @override
  State<ManageAddressesWidget> createState() => _ManageAddressesWidgetState();
}
bool itsTrue = false;
int index = 0;
class _ManageAddressesWidgetState extends State<ManageAddressesWidget> {

  List<Widget> bottomSheetWidgets = [
     ChangingAddressesBottomSheetWidget(index: index,),
      SaveAddressChangingWidget(onChanged: (value) => itsTrue = !itsTrue,value: itsTrue,),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.sp),
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.sp),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MarkManageAddressesWidget(
              markLocation: widget.markLocation,
              visibility: widget.visibility,
            ),
            Gap(1.h),
            Divider(
              thickness: 2.5.sp,
              color: AppColors.grey,
            ),
            Gap(1.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.name,
                    style: TextStyle(
                        color: AppColors.dark,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Gap(1.w),
                Expanded(
                  child: Text('( ${widget.phone} )',
                      style: TextStyle(
                          color: AppColors.dark,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
            Gap(1.h),
            Text(widget.address,
                style: TextStyle(
                    color: AppColors.dark,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            Gap(1.h),
            Row(
              children: [
                const AppSVG(
                  assetName: 'location',
                  color: AppColors.grey,
                ),
                Gap(2.w),
                Text('PinPoint already',
                    style: TextStyle(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
            Gap(1.h),
            AppButton(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17.sp)),
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 13.sp, horizontal: 17.sp),
                        child: bottomSheetWidgets[1]
                      ),
                    );
                  },
                );
              },
              label: 'Change Address',
              bgColor: Colors.white,
              textColor: AppColors.success,
              margin: EdgeInsets.symmetric(vertical: 1.sp),
            )
          ],
        ));
  }
}

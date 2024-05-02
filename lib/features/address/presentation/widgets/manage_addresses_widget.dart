import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/widgets/app_button.dart';
import 'package:e_commerece_app/features/address/presentation/widgets/changing_address_bottom_sheet_widget.dart';
import 'package:e_commerece_app/features/address/presentation/widgets/mark_manage_addresses_widget.dart';
import 'package:e_commerece_app/features/address/presentation/widgets/save_address_changeing_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class ManageAddressesWidget extends StatelessWidget {
   ManageAddressesWidget(
      {super.key,
      required this.markLocation,
      required this.visibility,
      required this.name,
      required this.note, required this.onItemSelected, required this.onDelete, required this.onChange,
  });
   final VoidCallback onDelete;

  final String markLocation;
  final String name;
  final String note;
  final bool visibility;
  final VoidCallback onItemSelected;
  final VoidCallback onChange;



  List<Widget> bottomSheetWidgets = [
     ChangingAddressesBottomSheetWidget(index: index,),
      SaveAddressChangingWidget(onChanged: (value) => itsTrue = !itsTrue,value: itsTrue,),
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onItemSelected,
      child: Container(
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
                markLocation: markLocation,
                visibility: visibility, onDelete: onDelete,
              ),
              Gap(1.h),
              Divider(
                thickness: 2.5.sp,
                color: AppColors.grey,
              ),
              Gap(1.h),
              Text(
                name,

                style: TextStyle(
                    color: AppColors.dark,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.sp),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Gap(1.h),
              Text(note,
                  style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis),
              Gap(1.h),
              AppButton(
                onPressed: onChange,
                  // showModalBottomSheet(
                  //   backgroundColor: Colors.white,
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return Container(
                  //       decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           borderRadius: BorderRadius.circular(17.sp)),
                  //       width: double.infinity,
                  //       child: Padding(
                  //         padding: EdgeInsets.symmetric(
                  //             vertical: 13.sp, horizontal: 17.sp),
                  //         child: bottomSheetWidgets[1]
                  //       ),
                  //     );
                  //   },
                  // );

                label: 'Change Address',
                bgColor: Colors.white,
                textColor: AppColors.success,
                margin: EdgeInsets.symmetric(vertical: 1.sp),
              )
            ],
          )),
    );
  }
}

bool itsTrue = false;
int index = 0;

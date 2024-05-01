import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/svg.dart';
import 'package:e_commerece_app/core/widgets/app_button.dart';
import 'package:e_commerece_app/features/profile/presentation/widgets/Manage%20Addresses%20Widget/manage_addresses_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangingAddressesBottomSheetWidget extends StatefulWidget {
  const ChangingAddressesBottomSheetWidget({super.key, required this.index});
  final int index;

  @override
  State<ChangingAddressesBottomSheetWidget> createState() => _ChangingAddressesBottomSheetWidgetState();
}

class _ChangingAddressesBottomSheetWidgetState extends State<ChangingAddressesBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 45.sp),
          child: Divider(height: 1.h,color: AppColors.grey,thickness: 7.sp,),
        ),
        Gap(2.h),
        Row(
          children: [
            Text(
              'Changing address',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            InkWell(
                onTap: () => pop(context) ,
                child: AppSVG(assetName: 'close',width: 20.sp,height: 20.sp,))
          ],
        ),
        SizedBox(height: 0.5.h),
        Row(
          children: [
            Text('1-5, El Gabalaya St, Zamalek, Cairo.',style:TextStyle(color: AppColors.dark,fontSize: 17.sp) ,),
            Gap(5.w),
            AppSVG(assetName: 'update',color: AppColors.dark,height: 17.sp,width: 17.sp,)
          ],
        ),
        Gap(4.h),
        AppButton(onPressed: () {
index ++;
        }, label: 'Continue',margin: EdgeInsets.symmetric(vertical: 1.sp),bgColor: Colors.green,textColor: Colors.white,),
        Gap(1.h),

      ],
    );
  }
}

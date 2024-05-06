import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/styles/themes.dart';
import 'package:e_commerece_app/core/utils/theme_enum.dart';
import 'package:e_commerece_app/core/widgets/app_button.dart';
import 'package:e_commerece_app/features/profile/presentation/widgets/app_bar_profile_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppAppearance extends StatefulWidget {
   const AppAppearance({super.key});

  @override
  State<AppAppearance> createState() => _AppAppearanceState();
}

class _AppAppearanceState extends State<AppAppearance> {
  Groceries? groceryItem = Groceries.Light;

  @override
  Widget build(BuildContext context) {

  return SafeArea(child: Scaffold(
      backgroundColor: AppColors.bg,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
        child: Column(children: [
          AppBarProfileItemsWidget(
            title: 'App Appearance',
            rightIcon: 'add',
            leftIcon: 'arrow',iconVisibility: false,
            onAdd: ()  {},
          ),
          Gap(3.h),
          Consumer<ThemeProvider>(
            builder: (context, orientation, screenType) {
             return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 40.h,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(17.sp)),
                          width: double.infinity,
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 13.sp, horizontal: 17.sp),
                              child: Column(children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 50.sp),
                                  child: Divider(height: 1.h,thickness: 0.4.h,),),
                                Gap(2.h),
                                Text(
                                  'Choose Theme',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Gap(1.h),
                                Divider(height: 0.05.h,thickness: 0.05.h,color: AppColors.grey.withOpacity(2.sp),),
                                Gap(2.h),
                                RadioListTile(
                                  value: 0,
                                  autofocus: true,
                                  groupValue: 0,activeColor: AppColors.success,
                                  onChanged: (value) {
                                    setState(() {
                                      orientation.changeTheme(value ?? 0);

                                    });
                                  },
                                  title:  Text('Light',style: TextStyle(fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ),
                                RadioListTile(
                                  value: 1,
                                  autofocus: true,
                                  groupValue: 0,activeColor: AppColors.success,
                                  onChanged: (value) {
                                    setState(() {
                                      orientation.changeTheme(value ?? 1);
                                    });
                                  },
                                  title:  Text('Dark',style: TextStyle(fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ),
                                RadioListTile(
                                  value: 2,
                                  autofocus: true,
                                  groupValue: 0,activeColor: AppColors.success,
                                  onChanged: (value) {
                                  setState(() {
                                    orientation.changeTheme(value ?? 2);

                                  });
                                  },
                                  title:  Text('System Defualt',style: TextStyle(fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ),

                                Gap(1.h),
                                Divider(height: 0.05.h,thickness: 0.05.h,color: AppColors.grey.withOpacity(2.sp),),
                                Gap(2.h),
                                Row(
                                  children: [
                                    Expanded(
                                      child: AppButton(onPressed: () {

                                      }, label: 'Cancel',bgColor: Colors.white,textColor: AppColors.success,margin: EdgeInsets.symmetric(horizontal: 1.sp),),
                                    ),
                                    Gap(3.w),
                                    Expanded(
                                      child: AppButton(onPressed: () {

                                      }, label: 'Ok',bgColor: AppColors.success,textColor: Colors.white,margin: EdgeInsets.symmetric(horizontal: 1.sp),),
                                    ),
                                  ],
                                )
                              ],)
                          ),
                        ),
                      );
                    },
                  );
                  setState(() {

                  });

                },
                child: Row(
                  children: [
                    Text(
                      'Theme' ,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Text(
                      'Theme' ,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gap(2.w),
                    Icon(Icons.arrow_forward_ios_rounded,size: 2.h,)
                  ],
                ),
              );
            },
          ),
          Gap(3.h),
          GestureDetector(
            onTap: () {

            },
            child: Row(
              children: [
                Text(
                  'Language' ,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Text(
                  'AR' ,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Gap(2.w),
                Icon(Icons.arrow_forward_ios_rounded,size: 2.h,)
              ],
            ),
          ),

        ],),
      ),
    ));
  }
}

import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeCategoriesWidget extends StatelessWidget {
  const HomeCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 10.h,
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        scrollDirection: Axis.horizontal,
        itemCount: 12,
        itemBuilder: (context, index) {
          return   Padding(
            padding:  EdgeInsets.all(8.sp),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  child: Opacity(
                    opacity: 2.2.sp,
                    child: AppImage(

                      imageUrl:
                      "https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c2hvcHBpbmd8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60",

                      height: 8.h,

                      topLeftRadius: 13.sp,
                      topRightRadius: 13.sp,
                      bottomLeftRadius: 13.sp,
                      bottomRightRadius: 13.sp, width: 16.w,
                    ),
                  ),
                ),
                Text("Electronics",style: TextStyle(color:AppColors.primary,fontSize: 13.sp,fontWeight: FontWeight.bold),)
              ],
            ),
          );
        },),
    );
  }
}

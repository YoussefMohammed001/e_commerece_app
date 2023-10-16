import 'package:animate_do/animate_do.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoriesComponent extends StatelessWidget {
  const CategoriesComponent({super.key, required this.categories, required this.index});
final List categories;
final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FadeIn(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            AppImage(
              imageUrl: categories[index].imageUrl,
              width: double.infinity,
              height: 52.sp,
              topLeftRadius: 13.sp,
              topRightRadius: 13.sp,
              bottomLeftRadius: 13.sp,
              bottomRightRadius: 13.sp,
            ),
            Container(
              width: double.infinity,
              height: 52.sp,
              decoration: BoxDecoration(
                  color: Colors.black54.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(13.sp)),
            ),
            Text(
              categories[index].name,
              style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

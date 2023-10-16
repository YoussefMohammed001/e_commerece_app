import 'package:animate_do/animate_do.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer(

          gradient: SweepGradient(

              colors: [
                Colors.grey.shade200,
                Colors.grey.shade200,
                Colors.grey.shade200,
                Colors.grey.shade200,
                Colors.grey.shade200,

              ]),
          child: Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.grey.shade300,
              child:ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FadeIn(
                      duration: Duration(milliseconds: 500),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          // AppImage(

                          //   imageUrl: categories[index].imageUrl,
                          //   width: double.infinity,
                          //   height: 52.sp,
                          //
                          //   topLeftRadius: 13.sp,
                          //   topRightRadius: 13.sp,
                          //   bottomLeftRadius: 13.sp,
                          //   bottomRightRadius: 13.sp,
                          // ),
                          Container(
                            width: double.infinity,
                            height: 52.sp,
                            decoration: BoxDecoration(
                                color: Colors.black54.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(13.sp)),
                          ),
                          Text(
                            '',
                            style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FadeIn(
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          // AppImage(
                          //   imageUrl: categories[index].imageUrl,
                          //   width: double.infinity,
                          //   height: 52.sp,
                          //
                          //   topLeftRadius: 13.sp,
                          //   topRightRadius: 13.sp,
                          //   bottomLeftRadius: 13.sp,
                          //   bottomRightRadius: 13.sp,
                          // ),
                          Container(
                            width: double.infinity,
                            height: 52.sp,
                            decoration: BoxDecoration(
                                color: Colors.black54.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(13.sp)),
                          ),
                          Text(
                            '',
                            style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FadeIn(
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          // AppImage(
                          //   imageUrl: categories[index].imageUrl,
                          //   width: double.infinity,
                          //   height: 52.sp,
                          //
                          //   topLeftRadius: 13.sp,
                          //   topRightRadius: 13.sp,
                          //   bottomLeftRadius: 13.sp,
                          //   bottomRightRadius: 13.sp,
                          // ),
                          Container(
                            width: double.infinity,
                            height: 52.sp,
                            decoration: BoxDecoration(
                                color: Colors.black54.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(13.sp)),
                          ),
                          Text(
                            '',
                            style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FadeIn(
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          // AppImage(
                          //   imageUrl: categories[index].imageUrl,
                          //   width: double.infinity,
                          //   height: 52.sp,
                          //
                          //   topLeftRadius: 13.sp,
                          //   topRightRadius: 13.sp,
                          //   bottomLeftRadius: 13.sp,
                          //   bottomRightRadius: 13.sp,
                          // ),
                          Container(
                            width: double.infinity,
                            height: 52.sp,
                            decoration: BoxDecoration(
                                color: Colors.black54.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(13.sp)),
                          ),
                          Text(
                            '',
                            style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FadeIn(
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          // AppImage(
                          //   imageUrl: categories[index].imageUrl,
                          //   width: double.infinity,
                          //   height: 52.sp,
                          //
                          //   topLeftRadius: 13.sp,
                          //   topRightRadius: 13.sp,
                          //   bottomLeftRadius: 13.sp,
                          //   bottomRightRadius: 13.sp,
                          // ),
                          Container(
                            width: double.infinity,
                            height: 52.sp,
                            decoration: BoxDecoration(
                                color: Colors.black54.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(13.sp)),
                          ),
                          Text(
                            '',
                            style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}

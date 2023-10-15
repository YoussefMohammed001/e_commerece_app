import 'package:animate_do/animate_do.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/widgets/app_image.dart';
import 'package:e_commerece_app/features/categories/domain/entities/categories.dart';
import 'package:e_commerece_app/features/categories/presentation/manager/categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class CategoriesItem extends StatelessWidget {
  CategoriesItem({super.key});
  List<Categories> categories = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state.requestState == RequestState.success) {
          categories = state.categories;
          return Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
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
              },
            ),
          );
        } else if (state.requestState == RequestState.loading) {
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
                    child:ListView(
                      children: [
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
                    ),
                    baseColor: Colors.grey.shade200,
                    highlightColor: Colors.grey.shade300)),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}

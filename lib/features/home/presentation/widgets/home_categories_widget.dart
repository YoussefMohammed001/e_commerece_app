import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/core/widgets/app_image.dart';
import 'package:e_commerece_app/features/category_products/presentation/pages/category_products_screen.dart';
import 'package:e_commerece_app/features/home/domain/entities/categories.dart';
import 'package:e_commerece_app/features/home/presentation/manager/home_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class HomeCategoriesWidget extends StatelessWidget {
  HomeCategoriesWidget({super.key});
  List<HomeCategories> categories = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.categoriesRequestState == RequestState.success) {
          categories = state.categories;
          safePrint("success===>>$categories");
          return Container(
            height: 14.h,
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {

                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Screen(),))
                    push(
                        context,
                        CategoriesProductsScreen(
                          id: categories[index].id.toString(),
                          category: categories[index].name,
                        ));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: Column(
                      children: [
                        AppImage(
                          imageUrl: categories[index].imageUrl,
                          height: 10.h,
                          topLeftRadius: 13.sp,
                          topRightRadius: 13.sp,
                          bottomLeftRadius: 13.sp,
                          bottomRightRadius: 13.sp,
                          width: 20.w,

                        ),
                        Text(
                          categories[index].name,
                          style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state.categoriesRequestState == RequestState.loading) {
          safePrint("fail");

          return SizedBox();
        } else {
          safePrint("fail");
          return SizedBox();
        }
      },
    );
  }
}

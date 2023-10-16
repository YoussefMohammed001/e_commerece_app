import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/core/widgets/app_image.dart';
import 'package:e_commerece_app/features/home/domain/entities/categories.dart';
import 'package:e_commerece_app/features/home/presentation/manager/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class HomeCategoriesWidget extends StatelessWidget {
   HomeCategoriesWidget({super.key});
List<HomeCategories> categories= [];
  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<HomeBloc, HomeState>(
  builder: (context, state) {

    if(state.categoriesRequestState == RequestState.success){
      categories = state.categories;
      safePrint("success===>>"+  categories.toString());
      return Container(
        height: 10.h,
        child: ListView.builder(
          padding: EdgeInsets.all(0),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return   Padding(
              padding:  EdgeInsets.all(8.sp),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  AppImage(

                    imageUrl: categories[index].imageUrl,

                    height: 37.h,

                    topLeftRadius: 13.sp,
                    topRightRadius: 13.sp,
                    bottomLeftRadius: 13.sp,
                    bottomRightRadius: 13.sp, width: 26.w,
                  ),
                  Container(
                    width: 26.w,
                    height: 37.sp,
                    decoration: BoxDecoration(
                        color: Colors.black54.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(13.sp)),
                  ),

                  Text(categories[index].name,style: TextStyle(color:AppColors.primary,fontSize: 13.sp,fontWeight: FontWeight.bold),)
                ],
              ),
            );
          },),
      );
    } else if(state.categoriesRequestState == RequestState.loading){
      safePrint("fail");

      return SizedBox();
    } else{
      safePrint("fail");
      return SizedBox();
    }

  },
);
  }
}

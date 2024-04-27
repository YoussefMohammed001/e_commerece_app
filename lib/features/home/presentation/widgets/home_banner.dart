import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/core/widgets/app_image.dart';
import 'package:e_commerece_app/features/home/domain/entities/banners.dart';
import 'package:e_commerece_app/features/home/presentation/manager/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class HomeBanner extends StatelessWidget {
  HomeBanner({super.key});
  CarouselController buttonCarouselController = CarouselController();

  List<Banners> banners = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if(state.bannersRequestState == RequestState.loading){
          return const SizedBox();
        } else if(state.bannersRequestState == RequestState.success){
            banners = state.banners;
            safePrint('=====================>$banners');
          return CarouselSlider.builder(

            options: CarouselOptions(
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 2),

            ),
            itemCount:banners.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal:20.sp,vertical: 25.sp),
                child: AppImage(
                  bottomLeftRadius: 18.sp,
                    bottomRightRadius: 18.sp,
                    topLeftRadius: 18.sp,
                    topRightRadius: 18.sp,
                    imageUrl: banners[index].imageUrl,
                    width: double.infinity,
                    height: 20.h),
              );
            },
          );
        } else{
          return const SizedBox();
        }
      },
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/core/widgets/app_image.dart';
import 'package:e_commerece_app/features/home/domain/entities/banners.dart';
import 'package:e_commerece_app/features/home/presentation/manager/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class HomeBanner extends StatelessWidget {
  HomeBanner({super.key});

  List<Banners> banners = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if(state.bannersRequestState == RequestState.loading){
          return SizedBox();
        } else if(state.bannersRequestState == RequestState.success){
            banners = state.banners;
            print('=====================>' + banners.toString());
          return CarouselSlider.builder(

            options: CarouselOptions(
              autoPlayInterval: const Duration(seconds: 2),
              autoPlay: true,

            ),
            itemCount:banners.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return AppImage(
                  imageUrl: banners[index].imageUrl,
                  width: double.infinity,
                  height: 20.h);
            },
          );
        } else{
          return SizedBox();
        }
      },
    );
  }
}

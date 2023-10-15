import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerece_app/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return   CarouselSlider.builder(
      options: CarouselOptions(
        autoPlayInterval: const Duration(seconds: 2),
        autoPlay: true,
        animateToClosest: true,


      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return AppImage(
            imageUrl:
            "https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c2hvcHBpbmd8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60",
            width: double.infinity,
            height: 20.h);
      },
    );

  }
}

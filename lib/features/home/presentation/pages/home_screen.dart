import 'package:e_commerece_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:e_commerece_app/features/home/presentation/widgets/home_banner.dart';
import 'package:e_commerece_app/features/home/presentation/widgets/home_categories_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeAppBar(
          title: 'Youssef',
          notifications: 5,
          cart: 1,
        ),
        HomeCategoriesWidget(),
        HomeBanner(),
       ],
    );
  }
}

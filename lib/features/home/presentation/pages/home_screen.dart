import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/features/home/presentation/manager/home_bloc.dart';
import 'package:e_commerece_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:e_commerece_app/features/home/presentation/widgets/home_banner.dart';
import 'package:e_commerece_app/features/home/presentation/widgets/home_categories_widget.dart';
import 'package:e_commerece_app/features/home/presentation/widgets/home_products.dart';
import 'package:e_commerece_app/features/saved_items/presentation/manager/favourite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          HomeBloc(sl(), sl(), sl())
            ..add(HomeCategoriesEvent())..add(HomeBannersEvent())..add(
              HomeProductsEvent()),
        ),

      ],
      child: Column(

        children: [
          HomeAppBar(
            title: 'Youssef',

            notifications: 3,
            cart: 0,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  HomeCategoriesWidget(),
                  HomeBanner(),
                  HomeProducts(),
                ],
              ),

            ),
          ),
        ],
      ),
    );
  }
}

import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/features/home/presentation/manager/home_bloc.dart';
import 'package:e_commerece_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:e_commerece_app/features/home/presentation/widgets/home_banner.dart';
import 'package:e_commerece_app/features/home/presentation/widgets/home_categories_widget.dart';
import 'package:e_commerece_app/features/home/presentation/widgets/home_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
      child: CustomScrollView(
        slivers: [
           SliverAppBar(
             leading:SizedBox(),
             leadingWidth: 0,
             stretch: true,
             toolbarHeight: 7.h,
             backgroundColor: AppColors.primary.withOpacity(0.2),
            title:    const HomeAppBar(
              title: 'Youssef',
              notifications: 3,
              cart: 0,
            ),



          ),

          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeBanner(),
                    HomeCategoriesWidget(),
                    SizedBox(height: 2.h,),
                    const HomeProducts(),
                  ],
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}

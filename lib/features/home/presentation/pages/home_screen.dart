import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/widgets/app_text_form_field.dart';
import 'package:e_commerece_app/features/home/presentation/manager/home_bloc.dart';
import 'package:e_commerece_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:e_commerece_app/features/home/presentation/widgets/home_banner.dart';
import 'package:e_commerece_app/features/home/presentation/widgets/home_categories_widget.dart';
import 'package:e_commerece_app/features/home/presentation/widgets/home_products.dart';
import 'package:e_commerece_app/features/search/presentation/pages/search_screen.dart';
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
            create: (context) => HomeBloc(sl(), sl(), sl())
              ..add(HomeCategoriesEvent())
              ..add(HomeBannersEvent())
              ..add(HomeProductsEvent()),
          ),
        ],
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: const SizedBox(),
              leadingWidth: 0,
              toolbarHeight: 3.h,
              pinned: true,
              flexibleSpace:  FlexibleSpaceBar(
                background: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.sp,
                  vertical: 12.sp
                  ),
                  child: const HomeAppBar(
                    title: 'Youssef',
                    notifications: 3,
                    cart: 0,
                  ),
                ),
              ),
              expandedHeight: 13.h,
              foregroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              bottom: PreferredSize(
                preferredSize:  Size.fromHeight(6.h),
                child: InkWell(
                  onTap: () {
                    push(context, SearchScreen());

                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 12.sp),
                    child: AppTextFormField(
                      isEnabled: false,
                      labelText: "Search here ......",
                      search: true,
                      textInputAction: TextInputAction.search,
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      prefixIcon: Icons.search,
                      isPass: false,
                    ),
                  ),
                ),
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
                      SizedBox(
                        height: 2.h,
                      ),
                      const HomeProducts(),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

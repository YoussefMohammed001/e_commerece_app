import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/features/categories/presentation/manager/categories_bloc.dart';
import 'package:e_commerece_app/features/categories/presentation/widgets/categories_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesBloc(sl())..add(EventCategories()),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(15.sp),
              width: double.infinity,
              color: AppColors.primary,
              child: Center(child: Text("Categories", style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),))),
          CategoriesList(),

        ],
      ),
    );
  }
}

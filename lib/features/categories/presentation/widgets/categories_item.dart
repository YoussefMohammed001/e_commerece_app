import 'package:e_commerece_app/core/utils/request_state.dart';
import 'package:e_commerece_app/features/categories/domain/entities/categories.dart';
import 'package:e_commerece_app/features/categories/presentation/manager/categories_bloc.dart';
import 'package:e_commerece_app/features/categories/presentation/widgets/categories_component.dart';
import 'package:e_commerece_app/features/categories/presentation/widgets/categories_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CategoriesList extends StatelessWidget {
  CategoriesList({super.key});
  List<Categories> categories = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state.requestState == RequestState.success) {
          categories = state.categories;
          return Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoriesComponent(categories: categories, index: index,);
              },
            ),
          );
        } else if (state.requestState == RequestState.loading) {
          return const CategoriesShimmer();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

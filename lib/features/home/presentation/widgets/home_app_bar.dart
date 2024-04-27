import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/core/widgets/app_text_form_field.dart';
import 'package:e_commerece_app/features/search/presentation/pages/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar(
      {super.key, required this.title, required this.notifications, required this.cart});

  final String title;
  final int notifications;
  final int cart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
       push(context, const SearchScreen());
      },
      child: Row(
        children: [
          Expanded(child: Text("")),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.sp,
            horizontal: 11.sp
            ),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12.sp)
            ),
            child: Icon(Icons.search,color: Colors.white,),
          ),
        ],
      ),
    );
  }
}

import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/core/utils/svg.dart';
import 'package:e_commerece_app/features/main_screen/manager/main_cubit.dart';
import 'package:e_commerece_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}



class _MainScreenState extends State<MainScreen> {
  MainCubit cubit = MainCubit();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          safePrint("Main");
          return Container(
            color: AppColors.primary,
            child: SafeArea(

              child: Scaffold(

                //floating action button position to center
                bottomNavigationBar: bottomNavBar(),
                body: cubit.screens[cubit.index],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget bottomNavBar() {


    return BottomNavigationBar(
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey[400],
      showSelectedLabels: true,
      showUnselectedLabels: false,

      onTap: (value) {
        cubit.index = value;
        setState(() {});
      },
      currentIndex: cubit.index,
      items:   <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label:S().home,
            icon: const AppSVG( assetName: 'home',)
        ),
         const BottomNavigationBarItem(
          label:"History",
            icon: AppSVG( assetName: 'history',)
        ),
          const BottomNavigationBarItem(
          label:"Profile",
            icon: AppSVG( assetName: 'profile',)
        ),
    ],
    );
  }
}
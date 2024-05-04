import 'package:e_commerece_app/features/cart/presentation/pages/cart_screen.dart';
import 'package:e_commerece_app/features/home/presentation/pages/home_screen.dart';
import 'package:e_commerece_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:e_commerece_app/features/saved_items/presentation/pages/fav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());


  int index = 0;
  List<Widget> screens = [
  const  HomeScreen(),
    const FavScreen(),
    const CartScreen(),
  const ProfileScreen(),


  ];

  void backToHome() {
    index = 0;
    emit(BackHomeState());
  }

  void switchToFavScreen() {
    index = 1;
    emit(SwitchToFavScreen());
  }
  void switchToCartScreen() {
    index = 2;
    emit(SwitchToCartScreen());
  }


  void switchToProfileScreen() {
    index = 3;
    emit(SwitchToProfileScreen());
  }

}

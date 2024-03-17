import 'package:e_commerece_app/features/cart/presentation/pages/cart_screen.dart';
import 'package:e_commerece_app/features/home/presentation/pages/home_screen.dart';
import 'package:e_commerece_app/features/profile/presentation/pages/Profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());


  int index = 0;
  List<Widget> screens = [
  const  HomeScreen(),
     CartScreen(),
  const ProfileScreen(),


  ];

  void backToHome() {
    index = 0;
    emit(BackHomeState());
  }

  void switchToAppointmentScreen() {
    index = 4;
    emit(SwitchToAppointmentScreen());
  }


  void switchToProfileScreen() {
    index = 3;
    emit(SwitchToProfileScreen());
  }

}

import 'package:e_commerece_app/core/shared/my_shared.dart';
import 'package:e_commerece_app/core/shared/my_shared_keys.dart';
import 'package:e_commerece_app/core/utils/theme_enum.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  int currentTheme = 0;

  ThemeMode get themeMode {
    if (currentTheme == 1) {
      return ThemeMode.dark;
    } if (currentTheme == 0) {
      return ThemeMode.light;
    } else {
      return ThemeMode.system;
    }
  }

  changeTheme(int theme) {
    MyShared.putInt(key: MySharedKeys.theme, value: theme);
    currentTheme = theme;
    notifyListeners();
  }

  initialize()async{
    currentTheme =  MyShared.getInt(key: MySharedKeys.theme);
    notifyListeners();
  }
}
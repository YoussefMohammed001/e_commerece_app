import 'dart:convert';

import 'package:e_commerece_app/core/shared/my_shared_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyShared {
  static SharedPreferences? _preferences;
  static const String _delimiter = "|";

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static void putBoolean({
    required MySharedKeys key,
    required bool value,
  }) async {
    await _preferences?.setBool(key.name, value);
  }

  static bool getBoolean({required MySharedKeys key}) {
    return _preferences?.getBool(key.name) ?? false;
  }

  static Future<bool> putString({
    required MySharedKeys key,
    required String? value,
  }) async {
    return await _preferences?.setString(key.name, value ?? "") ?? false;
  }

  static List<String> getStringAsList({required MySharedKeys key}) {
    final stringValue = _preferences?.getString(key.name) ?? "";
    return stringValue.isNotEmpty ? stringValue.split(_delimiter) : [];
  }
  static Future<bool> addStringToList({
    required MySharedKeys key,
    required String? value,
  }) async {
    final currentList = getStringAsList(key: key);
    currentList.add(value ?? "");
    return await _preferences?.setString(key.name, currentList.join(_delimiter)) ?? false;
  }

  static Future<void> removeStringFromList({required MySharedKeys key, required String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedValue = prefs.getString(key.name);
    if (storedValue == null || storedValue.isEmpty) {
      return;
    }
    List<String> list = storedValue.split(_delimiter);
    if (list.contains(value)) {
      list.remove(value);
    } else {
      return;
    }
    await prefs.setString(key.name, list.join(_delimiter));
  }





  static String getString({required MySharedKeys key}) {
    return _preferences?.getString(key.name) ?? "";
  }

  static String getCurrentLanguage() {
    return _preferences?.getString(MySharedKeys.currentLanguage.name) ?? "en";
  }

  static bool isLoggedIn() {
    return (_preferences?.getString(MySharedKeys.apiToken.name) ?? "")
        .isNotEmpty;
  }

  static Future<bool> putInt({
    required MySharedKeys key,
    required int? value,
  }) async {
    return await _preferences?.setInt(key.name, value ?? 0) ?? false;
  }

  static int getInt({required MySharedKeys key}) {
    return _preferences?.getInt(key.name) ?? 0;
  }

  static Future<bool> clear() async => await _preferences!.clear();

  static bool isEnglish() => getCurrentLanguage() == "en";

  static bool isFirstOpen() {
    return _preferences?.getBool(MySharedKeys.firstOpen.name) ?? true;
  }
}

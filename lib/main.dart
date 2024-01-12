import 'package:e_commerece_app/app.dart';
import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/shared/my_shared.dart';
import 'package:e_commerece_app/core/shared/my_shared_keys.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppDio.init();
 await  MyShared.init();
  ServicesLocator().init();
  safePrint("token================>${MyShared.getString(key: MySharedKeys.apiToken)}");
  runApp(const MyApp());
}
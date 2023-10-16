import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/shared/my_shared.dart';
import 'package:e_commerece_app/core/shared/my_shared_keys.dart';
import 'package:e_commerece_app/features/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  MyShared.init();
  AppDio.init();
  ServicesLocator().init();
  MyShared.putString(key: MySharedKeys.apiToken, value: "iFRcJGyyOfBMNbFnTieQpqdUxN0ahmaqDgMqGNSM9inPzQSsiTNqGlMBRwHw716koQt6YS");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
    return ResponsiveSizer(builder: (BuildContext , Orientation , ScreenType ) {
       return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: const MainScreen(),
      );

    },);

  }
}


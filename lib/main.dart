import 'package:e_commerece_app/core/api/my_dio.dart';
import 'package:e_commerece_app/core/services/services_locator.dart';
import 'package:e_commerece_app/core/shared/my_shared.dart';
import 'package:e_commerece_app/core/shared/my_shared_keys.dart';
import 'package:e_commerece_app/core/utils/safe_print.dart';
import 'package:e_commerece_app/features/login/presentation/pages/login_screen.dart';
import 'package:e_commerece_app/features/main_screen/main_screen.dart';
import 'package:e_commerece_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppDio.init();
 await  MyShared.init();
  ServicesLocator().init();
  safePrint("token============>${MyShared.getString(key: MySharedKeys.apiToken)}");
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

        key: ValueKey(MyShared.getCurrentLanguage()),
        debugShowCheckedModeBanner: false,
        // ignore: deprecated_member_use
        useInheritedMediaQuery: true,

        locale: Locale(MyShared.getCurrentLanguage()),
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          /* light theme settings */
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          /* dark theme settings */
        ),
        themeMode:ThemeMode.light ,

        home:  MyShared.getString(key: MySharedKeys.apiToken).isEmpty ? LoginScreen() : const MainScreen(),
        builder: EasyLoading.init(),

      );

    },);


    
  }
}


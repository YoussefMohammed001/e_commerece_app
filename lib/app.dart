import 'package:e_commerece_app/core/shared/my_shared.dart';
import 'package:e_commerece_app/core/shared/my_shared_keys.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/styles/themes.dart';
import 'package:e_commerece_app/features/login/presentation/pages/login_screen.dart';
import 'package:e_commerece_app/features/main_screen/main_screen.dart';
import 'package:e_commerece_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (v1, v2, v3) => Consumer<ThemeProvider>(

        builder: (context, orientation, screenType) {
          return MaterialApp(
          key: ValueKey(MyShared.getCurrentLanguage()),
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          locale: Locale(MyShared.getCurrentLanguage()),
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          color: AppColors.primary,
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            /* light theme settings */
          ),
            darkTheme: ThemeData.dark(),
          themeMode: orientation.themeMode,
          home: MyShared.getString(key: MySharedKeys.apiToken).isEmpty
              ?  LoginScreen()
              : const MainScreen(),
          builder: EasyLoading.init(),
        );
        },
      ),
    );
  }
}

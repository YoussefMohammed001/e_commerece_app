import 'package:e_commerece_app/core/shared/my_shared.dart';
import 'package:e_commerece_app/core/shared/my_shared_keys.dart';
import 'package:e_commerece_app/core/styles/colors.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/features/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

class NewsSettingsScreen extends StatefulWidget {
  const NewsSettingsScreen({super.key});

  @override
  State<NewsSettingsScreen> createState() => _NewsSettingsScreenState();
}

class _NewsSettingsScreenState extends State<NewsSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings',style: TextStyle(color: Colors.white),),
        backgroundColor: AppColors.primary,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [

          // settingItem(
          //   onTap: () {},
          //   icon: Icons.notifications,
          //   title: 'Notifications',
          // ),
          settingItem(
              onTap: () {},
              icon: Icons.color_lens_rounded,
              title: 'Theme',
              value: 'Light'),
          settingItem(
              onTap: () async {
             await   MyShared.putString(key: MySharedKeys.currentLanguage, value: 'en').then((value) {
                  setState(() {

                  });
                  pushReplacement(context, MainScreen());
                });
              },
              icon: Icons.language_rounded,
              title: 'Language',
              value: 'ar'),
        ],
      ),
    );
  }

  Widget settingItem({
    required GestureTapCallback onTap,
    required IconData icon,
    required String title,
    String value = '',
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.primary,
            ),
            const SizedBox(width: 5),
            Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
            const Spacer(),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 5),
            const Icon(Icons.keyboard_arrow_right_rounded),
          ],
        ),
      ),
    );
  }
}
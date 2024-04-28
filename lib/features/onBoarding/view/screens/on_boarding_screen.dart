import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Onboarding(
          startIndex: 0,
          animationInMilliseconds:2000 ,
          swipeableBody: const [
            Text("1"),
            Text("2"),
            Text("3"),
            Text("4"),
          ],
        ),
      ),
    );
  }
}

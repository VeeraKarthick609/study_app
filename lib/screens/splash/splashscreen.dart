import 'package:flutter/material.dart';

import '../../configs/themes/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(gradient: mainGradient(context)),
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/app_splash_logo.png',
            height: 200,
            width: 200,
          )),
    );
  }
}

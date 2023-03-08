import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_colors.dart';
import '../../widgets/app_circle_button.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(gradient: mainGradient(context)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: 65,
            ),
            SizedBox(height: 30),
            Text(
                style: TextStyle(
                  fontSize: 18,
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                'This is a study app, you can use it as you want. If you understand how this works, you can scale it.With this you will master firebase backend and flutter frontend'),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () => Get.offAllNamed("/home"),
              child: AppCircleButton(
                child: const Icon(
                  Icons.arrow_forward,
                  size: 35,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

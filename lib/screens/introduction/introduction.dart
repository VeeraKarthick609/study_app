import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_circle_button.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: 65,
              color: Colors.amber,
            ),
            SizedBox(height: 30),
            Text(
                'This is study app, you can use it as you want. If you understand how this works, you can scale it.With this you will master firebase backend and flutter frontend'),
            SizedBox(height: 30),
            AppCircleButton(
              onTap: () {},
              child: const Icon(
                Icons.arrow_forward,
                size: 35,
              ),
            )
          ],
        ),
      ),
    ));
  }
}

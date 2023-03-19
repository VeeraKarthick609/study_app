import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/buttons/main_button.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});
  static const String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: mainGradient(context),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/app_splash_logo.png',
            width: 200,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: Text(
              'This is a study app, you can use it as you want. If you understand how this works, you can scale it.With this you will master firebase backend and flutter frontend',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ),
          InkWell(
            onTap: () {
              controller.signInWithGoogle();
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: UIParameters.cardBorderRadius),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  child: SvgPicture.asset("assets/icons/google.svg"),
                  /* top: 0,
                  bottom: 0,
                  left: 5, */
                ),
                SizedBox(
                  width: 15,
                ),
                Center(
                  child: Text(
                    "Sign in with Google",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            ),
          )
        ],
      ),
    ));
  }
}

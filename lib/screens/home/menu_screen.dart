import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_colors.dart';
import '../../controllers/zoom_drawer_controller.dart';

class MenuScreen extends GetView<MyzoomDrawerController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(controller.user.value);
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient(context)),
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(primary: onSurfaceTextColor)),
        ),
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.06,
              bottom: MediaQuery.of(context).size.height * 0.06,
              left: 34,
              right: 4),
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  right: 0,
                  child: BackButton(
                    color: Colors.white,
                    onPressed: () {
                      controller.toggleDrawer();
                    },
                  )),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => controller.user.value == null
                        ? TextButton.icon(
                            icon: Icon(Icons.login),
                            label: Text('Sign in'),
                            onPressed: () => controller.signIn())
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                    controller.user.value!.photoURL.toString(),
                                    scale: 1.25),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                controller.user.value!.displayName ?? "",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                    color: onSurfaceTextColor),
                              ),
                            ],
                          )),
                    const Spacer(
                      flex: 1,
                    ),
                    DrawerButton(
                        icon: SvgPicture.asset(
                          "assets/icons/github.svg",
                          color: Colors.white,
                        ),
                        label: '  Github',
                        onPressed: () => controller.github()),
                    DrawerButton(
                        icon: SvgPicture.asset(
                          "assets/icons/instagram.svg",
                          color: Colors.white,
                        ),
                        label: 'Instagram',
                        onPressed: () => controller.instagram()),
                    DrawerButton(
                        icon: SvgPicture.asset(
                          "assets/icons/email.svg",
                          color: Colors.white,
                        ),
                        label: '  Email',
                        onPressed: () => controller.email()),
                    const Spacer(
                      flex: 4,
                    ),
                    TextButton.icon(
                        icon: Icon(Icons.logout),
                        label: Text('Log out'),
                        onPressed: () => controller.signOut())
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  DrawerButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.onPressed});
  final SvgPicture icon;
  final String label;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: icon,
      onPressed: onPressed,
      label: Text(label),
    );
  }
}

import 'package:flutter/material.dart';
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
                        ? SizedBox()
                        : Text(
                            controller.user.value!.displayName ?? "",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                                color: onSurfaceTextColor),
                          )),
                    const Spacer(
                      flex: 1,
                    ),
                    DrawerButton(
                        icon: Icons.web,
                        label: 'website',
                        onPressed: () => controller.website()),
                    DrawerButton(
                        icon: Icons.facebook,
                        label: 'FaceBook',
                        onPressed: () => controller.website()),
                    DrawerButton(
                        icon: Icons.email,
                        label: 'email',
                        onPressed: () => controller.email()),
                    const Spacer(
                      flex: 4,
                    ),
                    DrawerButton(
                        icon: Icons.logout,
                        label: 'Log out',
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
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(icon, size: 15),
      onPressed: onPressed,
      label: Text(label),
    );
  }
}

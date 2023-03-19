import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/custom_textstyles.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';
import 'package:study_app/screens/questions/test_overview_screen.dart';
import 'package:study_app/widgets/app_circle_button.dart';

import '../configs/themes/app_icons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar(
      {super.key,
      this.title = '',
      this.showActionIcon = false,
      this.leading,
      this.titlewidget,
      this.onMenuActionTap});
  final String title;
  final Widget? titlewidget;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: mobileScreenPadding, vertical: mobileScreenPadding),
        child: Stack(
          children: [
            Positioned.fill(
                child: titlewidget == null
                    ? Center(
                        child: Text(
                          title,
                          style: appbarTS,
                        ),
                      )
                    : Center(
                        child: titlewidget,
                      )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading ??
                    Transform.translate(
                      offset: const Offset(-14, 0),
                      child: const BackButton(),
                    ),
                if (showActionIcon)
                  Transform.translate(
                    offset: const Offset(10, 0),
                    child: GestureDetector(
                      child: const Icon(AppIcons.menu),
                      onTap: () {
                        print('Helloo');
                        Get.toNamed(TestOverviewScreen.routeName);
                      },
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 80);
}

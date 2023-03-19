import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_colors.dart';

class MainButton extends StatelessWidget {
  MainButton(
      {super.key,
      this.title = '',
      required this.onTap,
      this.enabled = true,
      this.child,
      this.color,
      this.height = 55,
      this.width,
      this.textcolor});
  final String title;
  final VoidCallback onTap;
  final enabled;
  final Widget? child;
  final Color? color;
  final double height;
  final double? width;
  final Color? textcolor;
  @override
  Widget build(BuildContext context) {
    Color? textColor;
    if (Get.isDarkMode || textcolor == null) {
      textColor = onSurfaceTextColor;
    }
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        width: 55,
        height: 55,
        child: InkWell(
          onTap: enabled == false ? null : onTap,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: color ?? Colors.white),
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: child ??
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textColor ?? Theme.of(context).primaryColor),
                      ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

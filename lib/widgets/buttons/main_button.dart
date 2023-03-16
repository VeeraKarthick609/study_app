import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  MainButton(
      {super.key,
      this.title = '',
      required this.onTap,
      this.enabled = true,
      this.child,
      this.color});
  final String title;
  final VoidCallback onTap;
  final enabled;
  final Widget? child;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        height: 55,
        child: InkWell(
          onTap: enabled == false ? null : onTap,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: child ??
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

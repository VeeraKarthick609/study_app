import 'package:flutter/material.dart';

import '../configs/themes/app_colors.dart';

class BackGroundDecoration extends StatelessWidget {
  BackGroundDecoration(
      {super.key, required this.child, this.showGradient = false});
  final bool showGradient;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Container(
          child: CustomPaint(painter: BackGroundPainer()),
          decoration: BoxDecoration(
              color: showGradient ? Theme.of(context).primaryColor : null,
              gradient: showGradient ? null : mainGradient(context)),
        )),
        Positioned.fill(child: SafeArea(child: child)),
      ],
    );
  }
}

class BackGroundPainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white.withOpacity(0.1);
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.2, 0);
    path.lineTo(0, size.height * 0.4);
    path.close();

    final path1 = Path();
    path1.moveTo(size.width, 0);
    path1.lineTo(size.width * 0.8, 0);
    path1.lineTo(size.width * 0.2, size.height);
    path1.lineTo(size.width, size.height);
    path1.close();
    canvas.drawPath(path, paint);
    canvas.drawPath(path1, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

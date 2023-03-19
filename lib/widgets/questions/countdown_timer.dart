import 'package:flutter/material.dart';

import '../../configs/themes/custom_textstyles.dart';

class CountDownTimer extends StatelessWidget {
  CountDownTimer({super.key, required this.time, this.color, this.size});
  final Color? color;
  final String time;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.timer,
          size: size,
          color: color ?? Theme.of(context).primaryColor,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          time,
          style: countDownTimerTs().copyWith(color: color, fontSize: 10),
        )
      ],
    );
  }
}

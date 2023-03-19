import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/widgets/questions/answer_card.dart';

import '../configs/themes/app_colors.dart';
import '../configs/themes/ui_parameters.dart';

class QuestionNumberCard extends StatelessWidget {
  QuestionNumberCard(
      {super.key,
      required this.index,
      required this.status,
      required this.onTap});
  final int index;
  final AnswerStatus? status;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    Color bgcolor = Theme.of(context).primaryColor;
    switch (status) {
      case AnswerStatus.answered:
        bgcolor = Get.isDarkMode
            ? Theme.of(context).cardColor
            : Theme.of(context).primaryColor;
        break;
      case AnswerStatus.notanswered:
        bgcolor = Get.isDarkMode
            ? Colors.red.withOpacity(0.5)
            : Theme.of(context).primaryColor.withOpacity(0.1);
        break;
      case AnswerStatus.wrong:
        bgcolor = wrongAnswer;
        break;
      case AnswerStatus.correct:
        bgcolor = correctAnswer;
        break;
      default:
        bgcolor = Theme.of(context).primaryColor.withOpacity(0.1);
    }
    return InkWell(
      onTap: onTap,
      borderRadius: UIParameters.cardBorderRadius,
      child: Ink(
        child: Center(
          child: Text(
            '$index',
            style: TextStyle(
                color: status == AnswerStatus.notanswered
                    ? Theme.of(context).primaryColor
                    : onSurfaceTextColor),
          ),
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: bgcolor, borderRadius: UIParameters.cardBorderRadius),
      ),
    );
  }
}

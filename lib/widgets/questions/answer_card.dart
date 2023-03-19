import 'package:flutter/material.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/ui_parameters.dart';

enum AnswerStatus {
  correct,
  wrong,
  answered,
  notanswered;
}

class AnswerCard extends StatelessWidget {
  AnswerCard(
      {super.key,
      required this.answer,
      this.isSelected = false,
      required this.onTap});
  final String answer;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Ink(
        decoration: BoxDecoration(
            border: Border.all(
                color: isSelected
                    ? answerSelectedColor(context)
                    : answerBorderColor(context)),
            borderRadius: UIParameters.cardBorderRadius,
            color: isSelected
                ? answerSelectedColor(context)
                : Theme.of(context).cardColor),
        child: Text(
          answer,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      ),
      borderRadius: UIParameters.cardBorderRadius,
      onTap: onTap,
    );
  }
}

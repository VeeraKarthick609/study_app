import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:study_app/configs/themes/app_light_theme.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';

import 'app_dark_theme.dart';

const Color onSurfaceTextColor = Colors.white;
const Color correctAnswer = Color(0xFF3ac3cb);
const Color wrongAnswer = Color(0x0ff85187);
const Color unanswered = Color(0xFF283c65);

const mainGradientLight = LinearGradient(
    colors: [primaryLightColorLight, primaryColorLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);

const mainGradientDark = LinearGradient(
    colors: [primaryDarkColorDark, primaryColorDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);

LinearGradient mainGradient(BuildContext context) =>
    UIParameters.isDarkMode() ? mainGradientDark : mainGradientLight;

Color customScaffoldColor(BuildContext context) => UIParameters.isDarkMode()
    ? const Color(0xFF2e3c62)
    : const Color.fromARGB(255, 240, 237, 255);

Color answerSelectedColor(BuildContext context) => UIParameters.isDarkMode()
    ? Theme.of(context).cardColor.withOpacity(0.5)
    : Theme.of(context).primaryColor;

Color answerBorderColor(BuildContext context) => UIParameters.isDarkMode()
    ? const Color.fromARGB(255, 20, 46, 158)
    : const Color.fromARGB(255, 221, 221, 221);

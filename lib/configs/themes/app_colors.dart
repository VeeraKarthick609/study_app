import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:study_app/configs/themes/app_light_theme.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';

import 'app_dark_theme.dart';

const Color onSurfaceTextColor = Colors.white;

const mainGradientLight = LinearGradient(
    colors: [primaryLightColorLight, primaryColorLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);

const mainGradientDark = LinearGradient(
    colors: [primaryDarkColorDark, primaryColorDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);

LinearGradient mainGradient(BuildContext context) =>
    UIParameters.isDarkMode(context) ? mainGradientDark : mainGradientLight;

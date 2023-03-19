import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/question_paper/questions_controller.dart';
import 'package:study_app/controllers/question_paper/questions_controllers_extension.dart';
import 'package:study_app/screens/questions/check_answer.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/app_light_theme.dart';
import '../../configs/themes/custom_textstyles.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../widgets/background_decoration.dart';
import '../../widgets/buttons/main_button.dart';
import '../../widgets/content_area.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/question_number_card.dart';
import '../../widgets/questions/answer_card.dart';

class ResultScreen extends GetView<QuestionController> {
  const ResultScreen({super.key});
  static const String routeName = '/resultScreen';
  @override
  Widget build(BuildContext context) {
    Color _textcolor =
        Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor;
    bool pass = double.parse(controller.points) >= 40.0;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: SizedBox(
          height: 80,
        ),
        title: controller.completedTest,
      ),
      body: BackGroundDecoration(
        child: Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ContentArea(
                child: Column(
                  children: [
                    pass ? Pass() : Fail(),
                    Text(
                      'You have scored ${controller.points} points',
                      style: TextStyle(color: _textcolor),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Tap below question numbers to view the correct answers',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 25),
                    Expanded(
                        child: GridView.builder(
                            itemCount: controller.allQuestions.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: Get.width ~/ 75,
                                    childAspectRatio: 1,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8),
                            itemBuilder: (_, index) {
                              final question = controller.allQuestions[index];
                              AnswerStatus status = AnswerStatus.wrong;
                              final selectedanswer = question.selectedAnswer;
                              final correctanswer = question.correctAnswer;
                              if (selectedanswer == correctanswer) {
                                status = AnswerStatus.correct;
                              } else if (selectedanswer == null) {
                                status = AnswerStatus.wrong;
                              }
                              return QuestionNumberCard(
                                index: index + 1,
                                status: status,
                                onTap: () {
                                  controller.jumpToQuestion(index,
                                      isGoBack: false);
                                  Get.toNamed(CheckScreen.routeName);
                                },
                              );
                            }))
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(children: [
              Expanded(
                child: MainButton(
                  color: primaryLightColorLight,
                  onTap: () {
                    controller.tryAgain();
                  },
                  title: 'Try Again',
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Visibility(
                    visible: controller.loadingStatus.value.isSuccess,
                    child: MainButton(
                      textcolor: Theme.of(context).primaryColor,
                      onTap: () {
                        controller.saveTestResults();
                      },
                      title: 'Go home',
                    )),
              )
            ]),
          )
        ]),
      ),
    );
  }
}

class Pass extends StatelessWidget {
  const Pass({super.key});

  @override
  Widget build(BuildContext context) {
    Color _textcolor =
        Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor;
    return Column(
      children: [
        SvgPicture.asset('assets/images/bulb.svg'),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 5),
          child: Text(
            'Congratulations',
            style: headerText.copyWith(color: _textcolor),
          ),
        )
      ],
    );
  }
}

class Fail extends StatelessWidget {
  const Fail({super.key});

  @override
  Widget build(BuildContext context) {
    Color _textcolor =
        Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 5),
          child: Text(
            'Oops',
            style: headerText.copyWith(color: _textcolor, fontSize: 28),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 5),
          child: Text(
            'Better luck next time',
            style: headerText.copyWith(color: _textcolor, fontSize: 18),
          ),
        ),
      ],
    );
  }
}

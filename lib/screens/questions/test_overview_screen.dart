import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/themes/custom_textstyles.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/question_paper/questions_controller.dart';
import '../../widgets/background_decoration.dart';
import '../../widgets/buttons/main_button.dart';
import '../../widgets/content_area.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/question_number_card.dart';
import '../../widgets/questions/answer_card.dart';
import '../../widgets/questions/countdown_timer.dart';

class TestOverviewScreen extends GetView<QuestionController> {
  const TestOverviewScreen({super.key});
  static const String routeName = '/testoverview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: controller.completedTest,
      ),
      body: BackGroundDecoration(
          child: Center(
              child: Column(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ContentArea(
                  child: Column(
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CountDownTimer(
                            color: UIParameters.isDarkMode()
                                ? Theme.of(context).textTheme.bodyLarge!.color
                                : Theme.of(context).primaryColor,
                            time: '',
                            size: 18,
                          ),
                          Obx(() => Text(
                                controller.time.toString() + ' Remaining',
                                style: countDownTimerTs(),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: GridView.builder(
                            itemCount: controller.allQuestions.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: Get.width ~/ 75,
                                    childAspectRatio: 1,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8),
                            itemBuilder: (_, index) {
                              AnswerStatus answerstatus =
                                  AnswerStatus.notanswered;
                              if (controller
                                      .allQuestions[index].selectedAnswer !=
                                  null) {
                                answerstatus = AnswerStatus.answered;
                              }
                              return QuestionNumberCard(
                                index: index + 1,
                                status: answerstatus,
                                onTap: () => controller.jumpToQuestion(index),
                              );
                            }),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: Container(
                          height: 55,
                          width: Get.width / 1.5,
                          child: MainButton(
                            color: controller.isLastQuestion
                                ? Theme.of(context).primaryColor
                                : null,
                            onTap: () {
                              controller.complete();
                            },
                            title: 'Complete',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
            ],
          )),
          showGradient: true),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';
import 'package:study_app/screens/questions/test_overview_screen.dart';
import 'package:study_app/widgets/content_area.dart';

import '../../configs/themes/custom_textstyles.dart';
import '../../controllers/question_paper/questions_controller.dart';
import '../../widgets/background_decoration.dart';
import '../../widgets/buttons/main_button.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/question_screen_holder.dart';
import '../../widgets/questions/answer_card.dart';
import '../../widgets/questions/countdown_timer.dart';

class QuestionScreen extends GetView<QuestionController> {
  const QuestionScreen({super.key});
  static const String routeName = '/questionScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        titlewidget: Obx(
          () => Text(
            'Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}',
            style: appbarTS,
          ),
        ),
        leading: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Obx(() => CountDownTimer(
                time: controller.time.value.toString(),
                color: onSurfaceTextColor,
              )),
          decoration: ShapeDecoration(
              shape: StadiumBorder(
                  side: BorderSide(color: onSurfaceTextColor, width: 2))),
        ),
        showActionIcon: true,
      ),
      body: BackGroundDecoration(
        child: Obx(() => Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if (controller.loadingStatus.value.isLoading)
                    ContentArea(child: QuestionScreenHolder()),
                  if (controller.loadingStatus.value.isSuccess)
                    Expanded(
                        child: ContentArea(
                      child: SingleChildScrollView(
                          padding: EdgeInsets.only(top: 25),
                          child: Column(
                            children: [
                              Text(
                                '${controller.currentQuestion.value!.question}',
                                style: questionText,
                              ),
                              GetBuilder<QuestionController>(
                                  id: 'answers_list',
                                  builder: (context) {
                                    return ListView.separated(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.only(top: 25),
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final answer = controller
                                              .currentQuestion
                                              .value!
                                              .answers[index];

                                          return AnswerCard(
                                            answer:
                                                '${answer.identifier}.${answer.answer}',
                                            onTap: () {
                                              controller.selectedAnswer(
                                                  answer.identifier);
                                            },
                                            isSelected: answer.identifier ==
                                                    controller.currentQuestion
                                                        .value!.selectedAnswer
                                                ? true
                                                : false,
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                        itemCount: controller.currentQuestion
                                            .value!.answers.length);
                                  }),
                              SizedBox(
                                height: Get.height / 4.25,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                child: Row(children: [
                                  Visibility(
                                    child: SizedBox(
                                      height: 55,
                                      width: 70,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 12.0),
                                        child: MainButton(
                                          onTap: () {
                                            controller.previousQuestion();
                                          },
                                          child: Icon(
                                            Icons.arrow_back_ios,
                                            color: UIParameters.isDarkMode()
                                                ? onSurfaceTextColor
                                                : Theme.of(context)
                                                    .primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    visible: controller.isFirstQuestion,
                                  ),
                                  Expanded(
                                    child: Visibility(
                                        visible: controller
                                            .loadingStatus.value.isSuccess,
                                        child: MainButton(
                                          color: controller.isLastQuestion
                                              ? Theme.of(context).primaryColor
                                              : null,
                                          textcolor: controller.isLastQuestion
                                              ? null
                                              : Theme.of(context).primaryColor,
                                          onTap: () {
                                            controller.isLastQuestion
                                                ? Get.toNamed(TestOverviewScreen
                                                    .routeName)
                                                : controller.nextQuestion();
                                          },
                                          title: controller.isLastQuestion
                                              ? 'Complete'
                                              : 'Next',
                                        )),
                                  )
                                ]),
                              )
                            ],
                          )),
                    )),
                ],
              ),
            ))),
        showGradient: true,
      ),
    );
  }
}

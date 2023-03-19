import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/screens/questions/result_screen.dart';

import '../../configs/themes/custom_textstyles.dart';
import '../../controllers/question_paper/questions_controller.dart';
import '../../widgets/background_decoration.dart';
import '../../widgets/content_area.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/questions/answer_card.dart';

class CheckScreen extends GetView<QuestionController> {
  const CheckScreen({super.key});
  static const String routeName = '/answercheckscreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
          titlewidget: Obx(() => Text(
                'Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}',
                style: appbarTS,
              ))),
      body: BackGroundDecoration(
        child: Obx(() => Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ContentArea(
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Text(
                          controller.currentQuestion.value!.question,
                          style: questionText,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        GetBuilder<QuestionController>(
                            id: 'answer_review_list',
                            builder: (_) {
                              return ListView.separated(
                                itemBuilder: (_, index) {
                                  final answer = controller
                                      .currentQuestion.value!.answers[index];
                                  final selectedAnswer = controller
                                      .currentQuestion.value!.selectedAnswer;
                                  final correctAnswer = controller
                                      .currentQuestion.value!.correctAnswer;
                                  final String answerText =
                                      '${answer.identifier}. ${answer.answer}';
                                  if (correctAnswer == selectedAnswer &&
                                      answer.identifier == selectedAnswer) {
                                    return CorrectAnswer(answer: answerText);
                                  } else if (selectedAnswer == null) {
                                    return NotAnswered(answer: answerText);
                                  } else if (correctAnswer != selectedAnswer &&
                                      answer.identifier == selectedAnswer) {
                                    return WrongAnswer(answer: answerText);
                                  } else if (correctAnswer ==
                                      answer.identifier) {
                                    return CorrectAnswer(answer: answerText);
                                  }
                                  return AnswerCard(
                                      answer: answerText, onTap: () {});
                                },
                                separatorBuilder: (_, index) {
                                  return const SizedBox(
                                    height: 10,
                                  );
                                },
                                itemCount: controller
                                    .currentQuestion.value!.answers.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                              );
                            })
                      ]),
                    ),
                  ),
                ))
              ],
            )),
      ),
    );
  }
}

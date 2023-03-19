import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:study_app/models/question_paper_models.dart';

import '../../firebase_ref/references.dart';
import '../../screens/questions/result_screen.dart';

class QuestionController extends GetxController {
  late QuestionPaperModel questionPaperModel;
  final loadingStatus = RxStatus.loading().obs;
  final allQuestions = <Questions>[];
  final questionIndex = 0.obs;
  bool get isFirstQuestion => questionIndex.value > 0;
  bool get isLastQuestion => questionIndex.value >= allQuestions.length - 1;
  Rxn<Questions> currentQuestion = Rxn<Questions>();
  @override
  void onReady() {
    final _questionPaper = Get.arguments as QuestionPaperModel;
    loadData(_questionPaper);
    super.onReady();
  }

  //Timer
  Timer? _timer;
  int remaininSeconds = 1;
  final time = '00.00'.obs;
  Future<void> loadData(QuestionPaperModel questionPaper) async {
    questionPaperModel = questionPaper;
    loadingStatus.value = RxStatus.loading();
    try {
      final QuerySnapshot<Map<String, dynamic>> questionQuery =
          await questionPaperRF
              .doc(questionPaper.id)
              .collection('questions')
              .get();
      final questions =
          questionQuery.docs.map((e) => Questions.fromSnapShot(e)).toList();
      questionPaper.questions = questions;
      for (Questions _question in questionPaper.questions!) {
        final QuerySnapshot<Map<String, dynamic>> answersQuery =
            await questionPaperRF
                .doc(questionPaper.id)
                .collection("questions")
                .doc(_question.id)
                .collection("answers")
                .get();
        final answers =
            answersQuery.docs.map((e) => Answers.fromSnapshot(e)).toList();

        _question.answers = answers;
      }
    } catch (e) {
      print(e.toString());
    }
    if (questionPaper.questions != null &&
        questionPaper.questions!.isNotEmpty) {
      allQuestions.assignAll(questionPaper.questions!);
      currentQuestion.value = questionPaper.questions![1];
      _startTimer(questionPaper.timeSeconds);
      loadingStatus.value = RxStatus.success();
    } else {
      loadingStatus.value = RxStatus.error();
    }
  }

  void selectedAnswer(String? answer) {
    currentQuestion.value!.selectedAnswer = answer;
    update(['answers_list']);
  }

  void nextQuestion() {
    if (questionIndex.value >= allQuestions.length - 1) {
      return;
    }
    questionIndex.value++;
    currentQuestion.value = allQuestions[questionIndex.value];
  }

  void previousQuestion() {
    if (questionIndex.value <= 0) {
      return;
    }
    questionIndex.value--;
    currentQuestion.value = allQuestions[questionIndex.value];
  }

  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remaininSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remaininSeconds == 0) {
        timer.cancel();
      } else {
        int minutes = remaininSeconds ~/ 60;
        int seconds = remaininSeconds % 60;
        time.value = minutes.toString().padLeft(2, "0") +
            ':' +
            seconds.toString().padLeft(2, "0");

        remaininSeconds--;
      }
    });
  }

  String get completedTest {
    final answered = allQuestions
        .where((element) => element.selectedAnswer != null)
        .toList()
        .length;
    return '${answered} out of ${allQuestions.length} answered';
  }

  void jumpToQuestion(int index, {bool isGoBack = true}) {
    questionIndex.value = index;
    currentQuestion.value = allQuestions[index];
    if (isGoBack) {
      Get.back();
    }
  }

  void complete() {
    _timer!.cancel();
    Get.offAndToNamed(ResultScreen.routeName);
  }
}

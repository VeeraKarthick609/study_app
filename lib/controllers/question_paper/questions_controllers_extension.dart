import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:study_app/controllers/question_paper/questions_controller.dart';

import '../../firebase_ref/references.dart';
import '../auth_controller.dart';

extension QuestionsControllerExtension on QuestionController {
  int get correctQuestionCount => allQuestions
      .where((element) => element.selectedAnswer == element.correctAnswer)
      .toList()
      .length;

  String get correctAnsweredQuestions =>
      '${correctAnsweredQuestions} out of ${allQuestions.length}';

  String get points {
    var marks = ((correctQuestionCount / allQuestions.length) * 100).toString();
    return marks;
  }

  Future<void> saveTestResults() async {
    var batch = fireStore.batch();
    User? _user = Get.find<AuthController>().getUser();
    if (_user == null) {
      return;
    } else {
      batch.set(
          userRF
              .doc(_user.email)
              .collection('my_recent_test')
              .doc(questionPaperModel.id),
          {
            "points": points,
            "correct_answers": '${correctQuestionCount}/${allQuestions.length}',
            "question_id": questionPaperModel.id,
            "time": questionPaperModel.timeSeconds - remaininSeconds
          });
      batch.commit();
      navigateToHome();
    }
  }
}

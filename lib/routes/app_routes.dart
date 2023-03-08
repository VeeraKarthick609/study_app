import 'package:get/get.dart';

import '../controllers/question_paper/question_paper_controller.dart';
import '../screens/home/home_screen.dart';
import '../screens/introduction/introduction.dart';
import '../screens/splash/splashscreen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/introduction', page: () => AppIntroductionScreen()),
        GetPage(
            name: '/home',
            page: () => HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
            }))
      ];
}

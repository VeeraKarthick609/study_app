import 'package:get/get.dart';

import '../controllers/question_paper/question_paper_controller.dart';
import '../controllers/question_paper/questions_controller.dart';
import '../controllers/zoom_drawer_controller.dart';
import '../screens/home/home_screen.dart';
import '../screens/introduction/introduction.dart';
import '../screens/login/login_screen.dart';
import '../screens/questions/questions_screen.dart';
import '../screens/questions/result_screen.dart';
import '../screens/questions/test_overview_screen.dart';
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
              Get.put(MyzoomDrawerController());
            })),
        GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
        GetPage(
            name: QuestionScreen.routeName,
            page: () => QuestionScreen(),
            binding: BindingsBuilder(() {
              Get.put<QuestionController>(QuestionController());
            })),
        GetPage(
            name: TestOverviewScreen.routeName,
            page: () => TestOverviewScreen()),
        GetPage(name: ResultScreen.routeName, page: () => ResultScreen())
      ];
}

import 'package:get/get.dart';

import '../screens/introduction/introduction.dart';
import '../screens/splash/splashscreen.dart';

class AppRoutes {
  static List<GetPage> routes() =>
      [GetPage(name: '/', page: () => AppIntroductionScreen())];
}

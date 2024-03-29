import 'package:get/get.dart';
import 'package:study_app/controllers/theme_controller.dart';

import '../controllers/auth_controller.dart';
import '../services/firebase_storage_services.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    Get.put(FirebaseStorageService());
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MyzoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {
    Get.find<AuthController>().signout();
  }

  void signIn() {
    Get.find<AuthController>().NavigatetoLoginPage();
  }

  Future<void> instagram() async {
    await _launch('https://instagram.com/veerakarthick5?igshid=ZDdkNTZiNTM=');
  }

  Future<void> github() async {
    await _launch('https://github.com/VeeraKarthick609');
  }

  void email() {
    final Uri _emaillaunchUri =
        Uri(scheme: 'mailto', path: 'veerakarthick609@gmail.com');
    _launch(_emaillaunchUri.toString());
  }

  Future<void> _launch(String url) async {
    if (!await launch(url)) {
      throw 'could not load $url';
    }
  }
}

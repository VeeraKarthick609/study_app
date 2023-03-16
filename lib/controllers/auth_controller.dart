import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:study_app/firebase_ref/references.dart';

import '../screens/login/login_screen.dart';
import '../widgets/dialogues/dialogue_widget.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;
  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;
  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
    navigateToIntroduction();
  }

  signInWithGoogle() async {
    final GoogleSignIn _googlesignin = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googlesignin.signIn();
      if (account != null) {
        final _authaccount = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
            idToken: _authaccount.idToken,
            accessToken: _authaccount.accessToken);
        await _auth.signInWithCredential(_credential);
        await saveUser(account);
      }
    } catch (e) {
      print(e);
    }
  }

  saveUser(GoogleSignInAccount account) {
    userRF.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl
    });
  }

  void navigateToIntroduction() {
    Get.offAllNamed("/introduction");
  }

  void showLoginAlertDialogue() {
    Get.dialog(Dialogs.questionStartDialog(onTap: () {
      Get.back();
      NavigatetoLoginPage();
    }), barrierDismissible: false);
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

  void NavigatetoLoginPage() {
    Get.toNamed(LoginScreen.routeName);
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:upwatch/base_controller.dart';
import 'package:upwatch/screen/splash_screen/splash_controller.dart';
import 'package:upwatch/screen/tabbar_screen/tabbar_screen.dart';

class LoginController extends BaseController {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  String error = "";
  RxBool isHide = true.obs;

  void loginWithEmailAndPassword() async {
    String email = this.controllerEmail.text;
    String password = this.controllerPassword.text;
    print("username : $email,password $password");
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      SplashController.userId = credential.user?.uid;

      Get.toNamed(TabBarScreen.routes);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        this.error = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        this.error = 'Wrong password provided for that user.';
      } else {
        this.error = e.code;
      }
    }
  }

  void signInWithGoogle() async {
    print("google");
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    print("heyyy");
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    var au = FirebaseAuth.instance;
    try {
      final cred1 = await au.signInWithCredential(credential);
      SplashController.userId = cred1.user?.uid;
      Get.toNamed(TabBarScreen.routes);
      await au.currentUser?.linkWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == "provider-already-linked") {}
    } catch (e) {
      print(e);
    }
  }

  void signInWithFB() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      switch (result.status) {
        case LoginStatus.success:
          final AuthCredential facebookCredential =
              FacebookAuthProvider.credential(result.accessToken!.token);
          final userCredential = await FirebaseAuth.instance
              .signInWithCredential(facebookCredential);
      }
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }
}

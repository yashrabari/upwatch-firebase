import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:upwatch/base_controller.dart';

import '../../common/all.dart';

class SignupController extends BaseController {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerCPassword = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  RxBool isCPHide = true.obs;
  RxBool isPHide = true.obs;
  RxBool isAgree = false.obs;

  RxString dropdownValue = Strings.select.obs;

  RxList? date = [].obs;

  void signUpWithEmailAndPassword() async {
    String name = this.controllerName.text;
    String email = this.controllerEmail.text;
    String password = this.controllerPassword.text;
    String cpassword = this.controllerCPassword.text;
    RxString dropdownValue = this.dropdownValue;
    RxList? date = this.date;
    RxBool isAgree = this.isAgree;

    print(
        "email $email,password:$password,cpassword:$cpassword,dropdown:$dropdownValue,DOB:$date,isAgree:$isAgree");

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      DatabaseReference ref =
          FirebaseDatabase.instance.ref("users/${userCredential.user?.uid}");
      await ref.set({
        "name": name,
        "email": email,
        "gender": dropdownValue.toString(),
        "dob": date.toString(),
      });

    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == "email-already-in-use") {
        print("yes");
      }
    }
  }
}

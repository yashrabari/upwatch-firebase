import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:upwatch/base_controller.dart';

import '../../common/all.dart';

class SignupController extends BaseController {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerCPassword = TextEditingController();
  RxBool isCPHide = true.obs;
  RxBool isPHide = true.obs;
  RxBool isAgree = false.obs;

  RxString dropdownValue = Strings.select.obs;

  RxList? date = [].obs;

  void signUpWithEmailAndPassword() async {
    String email = this.controllerEmail.text;
    String password = this.controllerPassword.text;
    String cpassword = this.controllerCPassword.text;
    RxString dropdownValue = this.dropdownValue;
    RxList? date = this.date;
    RxBool isAgree = this.isAgree;

    print(
        "email $email,password:$password,cpassword:$cpassword,dropdown:$dropdownValue,DOB:$date,isAgree:$isAgree");
  }
}

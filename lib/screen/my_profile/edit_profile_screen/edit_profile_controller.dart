import 'package:firebase_database/firebase_database.dart';
import 'package:upwatch/base_controller.dart';
import 'package:upwatch/screen/splash_screen/splash_controller.dart';

import '../../../common/all.dart';

class EditProfileController extends BaseController {
  RxList? date = [].obs;

  RxString dropdownValue = Strings.select.obs;

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerName = TextEditingController();

  void updateDetails() async {
    String name = this.controllerName.text;
    String email = this.controllerEmail.text;
    RxString dropdownValue = this.dropdownValue;
    RxList? date = this.date;

    print("email $email,dropdown:$dropdownValue,DOB:$date, name: $name");

    try {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("users/${SplashController.userId}");
      await ref.update({
        "name": name,
        "email": email,
        "gender": dropdownValue.toString(),
        "dob": date.toString(),
      });
    } catch (e) {}
  }
}

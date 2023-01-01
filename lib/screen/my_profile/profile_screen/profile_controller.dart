import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upwatch/base_controller.dart';
import 'package:upwatch/common/all.dart';
import 'package:upwatch/common/rx_common_model.dart';
import 'package:upwatch/screen/splash_screen/splash_controller.dart';

class ProfileController extends BaseController {
  RxList<RxCommonModel> profileList = [
    RxCommonModel(title: Strings.editProfile),
    RxCommonModel(title: Strings.medicalHistory),
    RxCommonModel(title: Strings.bodyMeasurement),
  ].obs;

  RxString? imageFile = "".obs;

  getFromCamera() async {
    Get.back();
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile!.value = pickedFile.path;
    }
    printAction("imageFile ------>>> ${imageFile!.value}");

    final profileRef = FirebaseStorage.instance.ref(SplashController.userId);

    try {
      final uploadTask = await profileRef.putFile(File(pickedFile!.path));

      String downloadUrl = (await profileRef.getDownloadURL()).toString();
      print(downloadUrl);

      DatabaseReference ref =
          FirebaseDatabase.instance.ref("users/${SplashController.userId}");
      await ref.update({
        "profile": downloadUrl,
      });
    } catch (e) {}

    update();
  }

  getFromGallery() async {
    Get.back();

    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile!.value = pickedFile.path;
    }

    printAction("imageFile ------>>> ${imageFile!.value}");
    update();
  }
}

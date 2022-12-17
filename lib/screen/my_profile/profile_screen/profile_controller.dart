import 'package:image_picker/image_picker.dart';
import 'package:upwatch/base_controller.dart';
import 'package:upwatch/common/all.dart';
import 'package:upwatch/common/rx_common_model.dart';

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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:upwatch/base_controller.dart';
import 'package:upwatch/screen/splash_screen/splash_controller.dart';

class DailyReportController extends BaseController {
  void onSelectionChanged(
      DateRangePickerSelectionChangedArgs
          dateRangePickerSelectionChangedArgs) {}
  RxString date = "".obs;
  String? toDayDate;

  TextEditingController controllerBloodGlucose = TextEditingController();
  TextEditingController controllerBloodOxygen = TextEditingController();
  TextEditingController controllerBPSystolic = TextEditingController();
  TextEditingController controllerBPDiastolic = TextEditingController();
  TextEditingController controllerBodyTemp = TextEditingController();
  TextEditingController controllerBodyWeight = TextEditingController();

  void saveDailyReport() async {
    String bloodGlucose = this.controllerBloodGlucose.text;
    String bloodOxygen = this.controllerBloodOxygen.text;
    String bpSystolic = this.controllerBPSystolic.text;
    String bpDiastolic = this.controllerBPDiastolic.text;
    String bodyTemp = this.controllerBodyTemp.text;
    String bodyWeight = this.controllerBodyWeight.text;

    if (date != "") {
      toDayDate = date.toString();
    }

    print(
        "glucose: $bloodGlucose, oxygen: $bloodOxygen, systolic: $bpSystolic, diastolic: $bpDiastolic, temp: $bodyTemp, bodyWeight: $bodyWeight");

    try {
      DatabaseReference ref = FirebaseDatabase.instance
          .ref("healthReport/${SplashController.userId}/$toDayDate");
      await ref.set({
        "glucose": bloodGlucose,
        "oxygen": bloodOxygen,
        "systolic": bpSystolic,
        "diastolic": bpDiastolic,
        "temp": bodyTemp,
        "weight": bodyWeight,
      });
    } catch (e) {}
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    toDayDate = utils.changeDateFormat(
        date: DateTime.now(), outputFormat: 'dd MMM yyyy');
  }
}

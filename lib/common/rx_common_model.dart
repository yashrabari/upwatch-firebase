import 'package:get/get.dart';

class RxCommonModel {
  RxBool? isSelected;
  int? index;
  RxInt? indexSelected;
  String? selectedValue = '';
  String? selectedSubValue = '';
  String? image = '';
  String title;
  String subTitle;
  String subTitle2;
  String identify;
  bool isSub;
  bool isThird;
  RxBool? isYes;
  RxBool? isNo;
  List<RxCommonModel>? listButton;
  List<bool>? isSelectedAns = [];

  RxCommonModel({
    this.indexSelected,
    this.index,
    this.selectedValue,
    this.selectedSubValue,
    this.image,
    this.isSelected,
    this.isSub = false,
    this.isThird = false,
    this.title = "",
    this.subTitle = "",
    this.subTitle2 = "",
    this.identify = "",
    this.isYes,
    this.isNo,
    this.listButton,
    this.isSelectedAns,
  });
}

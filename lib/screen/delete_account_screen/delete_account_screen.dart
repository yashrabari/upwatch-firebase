import 'package:upwatch/common/rx_common_model.dart';

import '../../common/all.dart';
import '../base_screen.dart';
import '../delete_confirm_screen/delete_confirm_screen.dart';
import 'delete_account_controller.dart';

class DeleteAccountScreen extends GetView<DeleteAccountController> {
  const DeleteAccountScreen({Key? key}) : super(key: key);
  static const routes = "/DeleteAccountScreen";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeleteAccountController>(
      builder: (_) {
        return BaseScreen(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 3.5.h),
                child: CommonBackArrow(
                  backArrowTap: () {
                    Get.back();
                  },
                  isBack: true,
                  isTitle: true,
                  title: Strings.deleteAccount,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                itemBuilder: (mContext, index) {
                  RxCommonModel model = controller.listSettings[index];

                  return CommonCheckBox(
                    title: model.title,
                    isSelection: index == controller.selectedIndex ? true : false,
                    onTap: () {
                      controller.selectedIndex = index;
                      controller.update();
                    },
                  );
                },
                itemCount: controller.listSettings.length,
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                margin: EdgeInsets.only(top: 2.h),
                child: CommonButton(
                  onTap: () {
                    Get.toNamed(DeleteConfirmScreen.routes);
                  },
                  width: double.infinity,
                  height: controller.appDimensions.btnHeight,
                  textSize: controller.appDimensions.btnTextSize,
                  textWeight: FontWeight.bold,
                  title: Strings.confirm.toUpperCase(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

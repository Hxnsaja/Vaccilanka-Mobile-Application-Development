import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void showLoadingAnimation(BuildContext context) {
  EasyLoading.instance.maskType = EasyLoadingMaskType.black;
  EasyLoading.show(status: "Please wait..");
}

void closeLoadingAnimation(BuildContext context) {
  EasyLoading.dismiss();
}

import 'package:get/get.dart';

class ExchangePageController extends GetxController {
  var isChangeScreen = 0.obs;
  var currentTopItem = 0.obs;
  var isIconChange = 0.obs;

  getCurrentTopItem(int index) {
    currentTopItem = index.obs;
    update();
  }

  changeScreen() {
    isChangeScreen == 0.obs ? isChangeScreen + 1 : isChangeScreen - 1;
    update();
  }

  changeIcon() {
    isIconChange = isIconChange == 0.obs ? 1.obs : 0.obs;
    update();
  }
}

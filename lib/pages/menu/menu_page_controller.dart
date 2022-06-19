import 'package:get/get.dart';

class MenuPageController extends GetxController {
  var menuIndex = 0.obs;
  changeMeneItem(int index) {
    menuIndex = index.obs;
    update();
  }
}

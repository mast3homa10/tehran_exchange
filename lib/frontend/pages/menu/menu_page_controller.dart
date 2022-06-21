import 'package:get/get.dart';

class MenuPageController extends GetxController {
  var menuItemIndex = 0.obs;
  var sliderItemIndex = 0.obs;
  changeMeneItemIndex(int index) {
    menuItemIndex = index.obs;
    update();
  }

  changeSliderItem(int index) {
    sliderItemIndex = index.obs;
    update();
  }
}

import 'package:get/get.dart';

class DashboardBodyController extends GetxController {
  var currentPage = 2.obs;

  getCurrentPage(int index) {
    currentPage = index.obs;
    update();
  }
}

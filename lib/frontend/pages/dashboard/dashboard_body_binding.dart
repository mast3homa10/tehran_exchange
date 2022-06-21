import 'package:get/get.dart';

import '../../pages/welcome/welcome_page_controller.dart';
import '../../../frontend/pages/exchange/exchange_page_controller.dart';
import '../menu/menu_page_controller.dart';
import 'dashboard_body_controller.dart';

class DashboardBodyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomePageController>(() => WelcomePageController());
    Get.lazyPut<DashboardBodyController>(() => DashboardBodyController());
    Get.lazyPut<ExchangePageController>(() => ExchangePageController());
    Get.lazyPut<MenuPageController>(() => MenuPageController());
  }
}

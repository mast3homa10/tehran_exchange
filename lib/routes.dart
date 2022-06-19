import 'package:get/get.dart';

import '/pages/menu/menu_page.dart';
import 'pages/dashboard_body_binding.dart';
import 'pages/exchange/exchange_page_body.dart';
import 'pages/exchange/sub_screen/qr_code_screen.dart';
import 'pages/guide/guide_page.dart';
import 'pages/dashboard_body.dart';
import 'pages/welcome/welcome_page.dart';

List<GetPage<dynamic>> routes = [
  GetPage(
    name: '/',
    page: () => const WelcomePage(),
    binding: DashboardBodyBinding(),
  ),
  GetPage(
    name: '/guide_page',
    page: () => GuidePage(),
    binding: DashboardBodyBinding(),
    transition: Transition.downToUp,
  ),
  GetPage(
    name: '/dashboard_body',
    page: () => DashboardBody(),
    binding: DashboardBodyBinding(),
    transition: Transition.downToUp,
  ),
  GetPage(
    name: '/exchange_page',
    page: () => ExchangePage(),
    binding: DashboardBodyBinding(),
    transition: Transition.downToUp,
  ),
  GetPage(
    name: '/menu_page',
    page: () => MenuPage(),
    binding: DashboardBodyBinding(),
    transition: Transition.downToUp,
  ),
  GetPage(
    name: '/scanner_page',
    page: () => QRCodeScreen(),
    binding: DashboardBodyBinding(),
    transition: Transition.downToUp,
  ),
];

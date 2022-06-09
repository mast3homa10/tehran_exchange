import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tehran_exchange/screens/welcome_screen.dart';

import 'screens/guide_screen.dart';

void main() => runApp(GetMaterialApp(
      locale: const Locale('fa', 'IR'),
      getPages: [
        GetPage(
          name: '/',
          page: () => WelcomeScreen(),
        ),
        GetPage(
          name: '/guide_screen',
          page: () => GuideScreen(),
          transition: Transition.downToUp,
        ),
      ],
      initialRoute: '/',
    ));

class Controller extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
  }
}

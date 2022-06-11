import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'screens/guide_screen.dart';
import 'screens/home_screen.dart';
import 'screens/welcome_screen.dart';

void main() async {
  runApp(GetMaterialApp(
    locale: const Locale('fa', 'IR'),
    getPages: [
      GetPage(
        name: '/',
        page: () => const WelcomeScreen(),
      ),
      GetPage(
        name: '/guide_screen',
        page: () => GuideScreen(),
        transition: Transition.downToUp,
      ),
      GetPage(
        name: '/home_page',
        page: () => const HomeScreen(),
        transition: Transition.downToUp,
      ),
    ],
    initialRoute: '/',
  ));
}

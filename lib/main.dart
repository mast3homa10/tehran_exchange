import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';
import 'screens/exchange_screen.dart';
import 'screens/guide_screen.dart';
import 'screens/screen_body.dart';
import 'screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return GetMaterialApp(
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
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
              name: '/main_screen',
              page: () => const ScreenBody(),
              transition: Transition.downToUp,
            ),
            GetPage(
              name: '/home_screen',
              page: () => ExchangeScreen(),
              transition: Transition.downToUp,
            ),
          ],
          initialRoute: '/',
        );
      }));
}

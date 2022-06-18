import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme_provider.dart';
import 'screens/exchange_screen_body.dart';
import 'screens/guide_screen.dart';
import 'screens/screen_body.dart';
import 'screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SharedPreferences.getInstance().then((prefs) {
    var isDarkTheme = prefs.getBool("darkTheme") ?? false;
    print(isDarkTheme);
    runApp(ChangeNotifierProvider(
        create: (context) => ThemeProvider(isDarkTheme),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);

          return GetMaterialApp(
            themeMode: themeProvider.getTheme(),
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
                name: '/exchange_screen',
                page: () => ExchangeScreen(),
                transition: Transition.downToUp,
              ),
            ],
            initialRoute: '/',
          );
        }));
  });
}

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  ThemeProvider(bool isDarkThemeOn) {
    themeMode = isDarkThemeOn ? ThemeMode.dark : ThemeMode.light;
  }

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
      print('isdark');
    }
  }

  void toggleTheme(bool isOn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isOn);
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  ThemeMode getTheme() => themeMode;
}

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      primaryColor: Colors.black,
      textTheme: const TextTheme(
        headline1: TextStyle(),
        bodyText1: TextStyle(),
        bodyText2: TextStyle(),
        button: kTextStyleDark5,
      ).apply(
        bodyColor: Colors.white,
        displayColor: Colors.blue,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.amber,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFF27E2FF),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            width: 2,
            color: Color(0xFF27E2FF),
          ),
        ),
      )),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF0F1119),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Color(0xFF0F1119),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xFF0F1119)));
////////////////////////////////////////////////////////////////////////////////////
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color(0xFFA822E7),
        ),
      ),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(),
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
      button: kTextStyleLight5,
    ).apply(
      bodyColor: Colors.black,
      displayColor: Colors.blue,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: kLightButtonColor, // This is a custom color variable
        textStyle: kTextButtonTextStyleLight5,
        side: const BorderSide(
          width: 2,
          color: kLightButtonColor,
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFEFF4FF),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xFFEFF4FF)),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      primaryColor: Colors.black,
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
      bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xFF0F1119)));

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
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      side: MaterialStateProperty.all<BorderSide>(
        const BorderSide(
          width: 2,
          color: Color(0xFFA822E7),
        ),
      ),
    )),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFEFF4FF),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xFFEFF4FF)),
  );
}

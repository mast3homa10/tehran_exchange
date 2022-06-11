// ignore_for_file: unused_element

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../ui/toggle_switch/widgets/animated_toggle_switch.dart';

class ToggleSwitchButton extends StatefulWidget {
  const ToggleSwitchButton({Key? key}) : super(key: key);

  @override
  State<ToggleSwitchButton> createState() => _ToggleSwitchButtonState();
}

class _ToggleSwitchButtonState extends State<ToggleSwitchButton> {
  int value = 0;
  bool positive = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AnimatedToggleSwitch<bool>.dual(
        innerColor: Colors.grey.shade400,
        current: positive,
        first: false,
        second: true,
        dif: 0.5,
        borderColor: Colors.transparent,
        borderWidth: 2.0,
        indicatorSize: const Size(30.0, double.infinity),
        height: 30,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2.5),
          ),
        ],
        onChanged: (b) => setState(() {
          positive = b;
          Get.changeTheme(
              Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
        }),
        colorBuilder: (b) => b ? Colors.white : Colors.black,
        iconBuilder: (value) => value
            ? const Icon(
                FontAwesomeIcons.moon,
                color: Colors.black,
              )
            : const Icon(
                FontAwesomeIcons.solidSun,
                color: Colors.white,
              ),
      ),
    );
  }
}

ThemeData _darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    color: Colors.red,
  ),
  brightness: Brightness.dark,
  primaryColor: Colors.amber,
);

ThemeData _lightTheme = ThemeData(
    backgroundColor: Colors.red,
    appBarTheme: const AppBarTheme(
      color: Colors.red,
    ),
    brightness: Brightness.light,
    primaryColor: Colors.blue);

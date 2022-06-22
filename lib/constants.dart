import 'package:flutter/material.dart';

import 'frontend/components/toggle_switch_button.dart';

const Color kLightBackgroundColor = Color(0xFFE5E5E5);
const Color kLightAppBarColor = Color(0xFFEFF4FF);
const Color kLightNavBarColor = Color(0xFFEFF4FF);
const Color kLightButtonColor = Color(0xFFA822E7);
const Color kLightChangerColor = Color(0xFF0F1119);
const Color kLightIconColor = Colors.black;
const Color kLightDividerColor = Colors.grey;

const Color kDarkBackgroundColor = Color(0xFF171C28);
const Color kDarkAppBarColor = Color(0xFF0F1119);
const Color kDarkNavBarColor = Color(0xFF0E0F17);
const Color kDarkButtonColor = Color(0xFF27E2FF);
const Color kDarkChangerColor = Color(0xFFEFF4FF);
const Color kDarkIconColor = Colors.white;
const Color kDarkDividerColor = Color(0xFFFFFFFF);

// const TextStyle kTitleTextStyle = TextStyle(
//   fontSize: 45,
//   fontWeight: FontWeight.bold,
//   color: Colors.black,
//   fontFamily: 'Yekanbakh',
// );

AppBar kAppbar = AppBar(
  elevation: 0.0,
  title: const SizedBox(
    height: 40,
    width: 40,
    child: AspectRatio(
      aspectRatio: 1 / 0.5,
      child: Image(
        image: AssetImage('assets/images/logo.png'),
      ),
    ),
  ),
  actions: const [
    ToggleSwitchButton(),
  ],
);

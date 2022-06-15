import 'package:flutter/material.dart';

import 'components/toggle_switch_button.dart';
import 'ui/intro/model/page_decoration.dart';

const Color kLightBackgroundColor = Color(0xFFE5E5E5);
const Color kLightAppBarColor = Color(0xFFEFF4FF);
const Color kLightNavBarColor = Color(0xFFEFF4FF);
const Color kLightButtonColor = Color(0xFFA822E7);
const Color kLightChangerColor = Color(0xFF0F1119);

const Color kDarkBackgroundColor = Color(0xFF171C28);
const Color kDarkAppBarColor = Color(0xFF0F1119);
const Color kDarkNavBarColor = Color(0xFF0E0F17);
const Color kDarkButtonColor = Color(0xFF27E2FF);
const Color kDarkChangerColor = Color(0xFFEFF4FF);

const TextStyle kTextStyleLight5 = TextStyle(
    fontFamily: 'Yekanbakh', fontSize: 18, color: kLightBackgroundColor);

const TextStyle kTextStyleDark5 = TextStyle(
    fontFamily: 'Yekanbakh', fontSize: 18, color: kDarkBackgroundColor);

const TextStyle kTextButtonTextStyleLight5 =
    TextStyle(fontFamily: 'Yekanbakh', fontSize: 18, color: Color(0xFFA822E7));

const TextStyle kTextButtonTextStyleDark5 =
    TextStyle(fontFamily: 'Yekanbakh', fontSize: 18, color: kDarkButtonColor);

const TextStyle kDescriptionTextStyle =
    TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'Yekanbakh');

const TextStyle kTitleTextStyle = TextStyle(
  fontSize: 45,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontFamily: 'Yekanbakh',
);

const kPageDecorationLightMode = PageDecoration(
  titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
  bodyTextStyle: kTitleTextStyle,
  // bodyTextStyle: bodyStyle
  // bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
  pageColor: Colors.white,
  imagePadding: EdgeInsets.zero,
);

AppBar kAppbar = AppBar(
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

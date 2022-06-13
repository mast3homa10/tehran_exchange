import 'package:flutter/material.dart';

import 'components/toggle_switch_button.dart';
import 'ui/intro/model/page_decoration.dart';

const Color kBackgroundColorLightMode = Colors.white;
const Color kButtonBackgroundColorLightMode = Color(0xFFA822E7);
const Color kChangerContainerColor = Color(0xFF0F1119);

const TextStyle kButtonTextStyle_1 = TextStyle(
    fontFamily: 'Yekanbakh',
    fontSize: 18,
    color: kButtonBackgroundColorLightMode);

const TextStyle kButtonTextStyle_2 = TextStyle(
    fontFamily: 'Yekanbakh', fontSize: 18, color: kBackgroundColorLightMode);

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

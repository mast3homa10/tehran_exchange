import 'package:flutter/material.dart';

import 'ui/intro/model/page_decoration.dart';

const Color kBackgroundColor = Colors.white;
const Color kButtonBackgroundColor = Color(0xFFA822E7);

const TextStyle kButtonTextStyle_1 = TextStyle(
    fontFamily: 'Yekanbakh', fontSize: 18, color: kButtonBackgroundColor);

const TextStyle kButtonTextStyle_2 =
    TextStyle(fontFamily: 'Yekanbakh', fontSize: 18, color: kBackgroundColor);

const TextStyle kDescriptionTextStyle =
    TextStyle(fontSize: 16, fontFamily: 'Yekanbakh');

const TextStyle kTitleTextStyle = TextStyle(
  fontSize: 45,
  fontWeight: FontWeight.bold,
  fontFamily: 'Yekanbakh',
);

const kPageDecoration = PageDecoration(
  titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
  bodyTextStyle: kTitleTextStyle,
  // bodyTextStyle: bodyStyle
  // bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
  pageColor: Colors.white,
  imagePadding: EdgeInsets.zero,
);

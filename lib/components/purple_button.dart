import 'package:flutter/material.dart';

import '../constants.dart';

class PurpleButton extends StatelessWidget {
  const PurpleButton(
      {Key? key, required this.titleWidget, required this.onPressed})
      : super(key: key);
  final VoidCallback onPressed;
  final Widget titleWidget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 62,
        width: 164,
        decoration: BoxDecoration(
          border: Border.all(
            color: kButtonBackgroundColor,
            style: BorderStyle.solid,
            width: 2.0,
          ),
          color: const Color(0xFFA822E7),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(child: titleWidget),
      ),
      onTap: onPressed,
    );
  }
}

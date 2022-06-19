import 'package:flutter/material.dart';

class PurpleButton extends StatelessWidget {
  const PurpleButton({
    Key? key,
    required this.titleWidget,
  }) : super(key: key);
  final Widget titleWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      width: 164,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFA822E7),
          style: BorderStyle.solid,
          width: 2.0,
        ),
        color: const Color(0xFFA822E7),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Center(child: titleWidget),
    );
  }
}

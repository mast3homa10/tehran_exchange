import 'package:flutter/material.dart';

class CustomBigButton extends StatelessWidget {
  const CustomBigButton(
      {Key? key, this.label = 'کلیک', required this.onPressed})
      : super(key: key);

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
        child: SizedBox(
          height: 62,
          child: Center(
              child: Text(
            label, //todo : change style
          )),
        ),
        onPressed: onPressed);
  }
}

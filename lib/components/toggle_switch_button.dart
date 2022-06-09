import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        onChanged: (b) => setState(() => positive = b),
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

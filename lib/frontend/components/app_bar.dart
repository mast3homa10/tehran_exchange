import 'package:flutter/material.dart';

import 'toggle_switch_button.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: double.infinity,
        height: 82,
        decoration: const BoxDecoration(color: Color(0xFFEFF4FF)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            ToggleSwitchButton(),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: AspectRatio(
                aspectRatio: 9 / 18,
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:tehran_exchange/frontend/components/custom_menu_item.dart';
import 'package:tehran_exchange/frontend/components/toggle_switch_button.dart';

class SettingMenuPage extends StatelessWidget {
  SettingMenuPage({
    Key? key,
  }) : super(key: key);
  final isSelected = false;
  final menu = [
    CustomMenuItem(
      label: 'نوتیفیکیشن ها',
      icon: FontAwesomeIcons.bell,
      buildSubScreen: Row(children: [
        const Text(
          'اجاره دادن به نوتیفیکیشن',
        ),
        const ToggleSwitchButton(),
        ToggleButtons(
          children: const [
            Text('data'),
            Text('data'),
          ],
          isSelected: const [
            true,
            false,
          ],
        ),
      ]),
    ),
    const CustomMenuItem(
      label: 'رمز عبور',
      icon: FontAwesomeIcons.lock,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menu.length,
      itemBuilder: (context, index) => menu[index],
    );
  }

  Widget buildNotificationSubScreen() {
    return Row(
      children: const [
        Text('اجاره دادن به نوتیفیکیشن'),
      ],
    );
  }
}

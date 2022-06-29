import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tehran_exchange/frontend/components/custom_menu_item.dart';

class ServiceMenuPage extends StatelessWidget {
  ServiceMenuPage({
    Key? key,
  }) : super(key: key);
  final menu = [
    const CustomMenuItem(label: 'دفترچه آدرس', icon: FontAwesomeIcons.bookOpen),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menu.length,
      itemBuilder: (context, index) => menu[index],
    );
  }
}

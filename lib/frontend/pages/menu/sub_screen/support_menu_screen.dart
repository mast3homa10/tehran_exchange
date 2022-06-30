import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tehran_exchange/frontend/components/custom_menu_item.dart';

class SupportMenuScreen extends StatelessWidget {
  SupportMenuScreen({
    Key? key,
  }) : super(key: key);
  final menu = [
    const CustomMenuItem(
        label: 'آموزش استفاده', icon: FontAwesomeIcons.bookOpenReader),
    const CustomMenuItem(
        label: 'سوالات متداول', icon: FontAwesomeIcons.circleQuestion),
    const CustomMenuItem(label: 'گذاشتن نظر', icon: FontAwesomeIcons.comment),
    const CustomMenuItem(
        label: 'شرایط و قوانین', icon: FontAwesomeIcons.circleExclamation),
    const CustomMenuItem(
        label: 'حریم خصوصی', icon: FontAwesomeIcons.circleExclamation),
    const CustomMenuItem(
        label: 'ریسک افشای اطلاعات', icon: FontAwesomeIcons.circleExclamation),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menu.length,
      itemBuilder: (context, index) => menu[index],
    );
  }
}

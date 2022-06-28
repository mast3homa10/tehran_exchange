import 'dart:io';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../frontend/components/nav_bar/first_nav_bar.dart';
import '../../../constants.dart';
import '../../pages/dashboard/dashboard_body_controller.dart';
import '../menu/menu_page.dart';
import '../support/support_page.dart';
import '../history/history_page.dart';
import '../exchange/exchange_page_body.dart';

class DashboardBody extends StatelessWidget {
  DashboardBody({Key? key}) : super(key: key);

  final screens = [
    const MenuPage(),
    const SupportPage(),
    ExchangePage(),
    const HistoryPage(),
  ];

  /// The onBackPressed is for Restrict Android backButton
  Future<bool?> onBackPressed(BuildContext context) async {
    Get.defaultDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: "توجه!",
      titleStyle: Theme.of(context).textTheme.headline4,
      content: Text(
        'آیا میخواید از برنامه خارج شوید؟',
        style: Theme.of(context).textTheme.headline4,
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: const Text(
                'بله',
                style: TextStyle(
                    fontSize: 20, fontFamily: "Yekanbakh", color: Colors.green),
              ),
              onPressed: () {
                exit(0);
              },
            ),
            const SizedBox(
              width: 20,
            ),
            TextButton(
              child: const Text(
                'خیر',
                style: TextStyle(
                    fontSize: 20, fontFamily: "Yekanbakh", color: Colors.red),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardBodyController>(builder: (controller) {
      return WillPopScope(
        onWillPop: () async {
          bool? result = await onBackPressed(context);
          result ??= false;
          return result;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: kAppbar,
          body: SafeArea(
            // the indexed stack widget change screen by help of nav bar
            child: IndexedStack(
              children: screens,
              index: controller.currentPage.value,
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 82,
            child: Column(
              children: [
                const Divider(
                  height: 3,
                  thickness: 2,
                ),
                Expanded(
                  child: BottomNavBar(
                      selectedIndex: controller.currentPage.value,
                      showElevation: true,
                      itemCornerRadius: 24,
                      curve: Curves.easeIn,
                      onItemSelected: (index) =>
                          controller.getCurrentPage(index),
                      items: items),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

List<BottomNavBarItem> items = [
  BottomNavBarItem(
    activeColor: kLightButtonColor,
    icon: const Icon(FontAwesomeIcons.ellipsisVertical),
    title: const Text('منو'),
    textAlign: TextAlign.center,
  ),
  BottomNavBarItem(
    inactiveColor: Colors.black,
    activeColor: kLightButtonColor,
    icon: const Icon(FontAwesomeIcons.headset),
    title: const Text('پشتیبانی'),
    textAlign: TextAlign.center,
  ),
  BottomNavBarItem(
    inactiveColor: Colors.black,
    activeColor: kLightButtonColor,
    icon: const Icon(
      // ignore: deprecated_member_use
      FontAwesomeIcons.exchange,
    ),
    title: const Text('مبادله '),
    textAlign: TextAlign.center,
  ),
  BottomNavBarItem(
    inactiveColor: Colors.black,
    activeColor: kLightButtonColor,
    icon: const Icon(FontAwesomeIcons.clockRotateLeft),
    title: const Text('تاریخچه سفارشات'),
    textAlign: TextAlign.center,
  ),
];

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tehran_exchange/frontend/components/nav_bar/second_nav_bar.dart';

import '../../../constants.dart';
import '../../pages/exchange/exchange_page_controller.dart';
import 'sub_screen/address_book_screen.dart';
import 'sub_screen/calculate_screen.dart';
import 'sub_screen/exchange_part.dart';

class ExchangePage extends GetView<ExchangePageController> {
  ExchangePage({Key? key}) : super(key: key);
  final TextEditingController firstTextController = TextEditingController();
  final TextEditingController secondTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (ExchangePageController controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: controller.isChangeScreen.toInt() == 1
            ? ExchangePageBody()
            : const CalculatePage(),
      );
    });
  }
}

class ExchangePageBody extends GetView<ExchangePageController> {
  ExchangePageBody({
    Key? key,
  }) : super(key: key);

  final subScreen = [
    // Center(
    //     child: Column(
    //   children: [
    //     SizedBox(
    //       height: Get.height < 700 ? Get.height * 0.47 : Get.height * 0.5,
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.all(15.0),
    //       child: CustomBigButton(
    //         label: 'اسکن',
    //         onPressed: () {
    //           Get.to(const QRCodeScreen());
    //         },
    //       ),
    //     ),
    //   ],
    // )),
    const ExchangePart(),
    const AddressBookScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (ExchangePageController controller) {
      return Column(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height * 0.15,
            child: TopNavBar(
                selectedIndex: controller.currentTopItem.toInt(),
                showElevation: true,
                itemCornerRadius: 24,
                curve: Curves.easeIn,
                onItemSelected: (index) => controller.getCurrentTopItem(index),
                items: topItems),
          ),
          subScreen[controller.currentTopItem.toInt()],
        ],
      );
    });
  }
}

List<TopNavBarItem> topItems = [
  // TopNavBarItem(
  //   inactiveColor: Colors.black,
  //   activeColor: kLightButtonColor,
  //   icon: const Icon(FontAwesomeIcons.qrcode),
  //   title: const Text('اسکن کیف پول'),
  //   textAlign: TextAlign.center,
  // ),
  TopNavBarItem(
    inactiveColor: Colors.black,
    activeColor: kLightButtonColor,
    icon: const Icon(FontAwesomeIcons.wallet),
    title: const Text('اضافه کردن کیف پول'),
    textAlign: TextAlign.center,
  ),
  TopNavBarItem(
    inactiveColor: Colors.black,
    activeColor: kLightButtonColor,
    icon: const Icon(
      // ignore: deprecated_member_use
      FontAwesomeIcons.book,
    ),
    title: const Text('دفترچه آدرس '),
    textAlign: TextAlign.center,
  ),
];

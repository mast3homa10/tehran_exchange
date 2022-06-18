import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tehran_exchange/ui/nav_bar/second_nav_bar.dart';

import '../controllers/controller_1.dart';
import '../constants.dart';
import 'sub_screen/address_book_screen.dart';
import 'sub_screen/calculate_screen.dart';
import 'sub_screen/exchange_part.dart';

class ExchangeScreen extends StatelessWidget {
  ExchangeScreen({Key? key}) : super(key: key);
  final TextEditingController firstTextController = TextEditingController();
  final TextEditingController secondTextController = TextEditingController();
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => controller.isChangeScreen.toInt() == 1
            ? ExchangeScreenBody(controller: controller)
            : CalculateScreen(controller: controller),
      ),
    );
  }
}

class ExchangeScreenBody extends StatefulWidget {
  const ExchangeScreenBody({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final Controller controller;

  @override
  State<ExchangeScreenBody> createState() => _ExchangeScreenBodyState();
}

class _ExchangeScreenBodyState extends State<ExchangeScreenBody> {
  int currentIndex = 1;
  final subScreen = [
    const Center(child: Text('test')),
    ExchangePart(),
    const AddressBookScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: Get.width,
          height: Get.height * 0.15,
          child: TopNavBar(
            selectedIndex: currentIndex,
            showElevation: true,
            itemCornerRadius: 24,
            curve: Curves.easeIn,
            onItemSelected: (index) => setState(() => currentIndex = index),
            items: <TopNavBarItem>[
              TopNavBarItem(
                inactiveColor: Colors.black,
                activeColor: kLightButtonColor,
                icon: const Icon(FontAwesomeIcons.qrcode),
                title: const Text('اسکن کیف پول'),
                textAlign: TextAlign.center,
              ),
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
            ],
          ),
        ),
        subScreen[currentIndex],
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../components/toggle_switch_button.dart';
import '../constants.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  Container(child: Text('text')),
                  Text('text'),
                  Text('text'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                  child: Container(
                    height: 62,
                    width: 403,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kButtonBackgroundColor,
                        style: BorderStyle.solid,
                        width: 2.0,
                      ),
                      color: const Color(0xFFA822E7),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: const Center(
                        child: Text(
                      'وارد کردن آدرس',
                      style: kButtonTextStyle_2,
                    )),
                  ),
                  onTap: () {
                    Get.snackbar('توجه!', "در حال توسعه ...");
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration:
            BoxDecoration(border: Border.all(width: 1.0, color: Colors.grey)),
        child: BottomNavyBar(
          backgroundColor: const Color(0xFFEFF4FF),
          selectedIndex: _currentIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: (index) => setState(() => _currentIndex = index),
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              inactiveColor: Colors.black,
              activeColor: kButtonBackgroundColor,
              icon: const Icon(FontAwesomeIcons.ellipsisVertical),
              title: const Text('منو'),
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              inactiveColor: Colors.black,
              activeColor: kButtonBackgroundColor,
              icon: const Icon(FontAwesomeIcons.headset),
              title: const Text('پشتیبانی'),
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              inactiveColor: Colors.black,
              activeColor: kButtonBackgroundColor,
              icon: const Icon(FontAwesomeIcons.upDown),
              title: const Text('مبادله '),
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              inactiveColor: Colors.black,
              activeColor: kButtonBackgroundColor,
              icon: const Icon(FontAwesomeIcons.clockRotateLeft),
              title: const Text('تاریخچه سفارشات'),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

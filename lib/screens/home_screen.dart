import 'dart:io';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../ui/nav_bar/nav_bar.dart';
import '../components/toggle_switch_button.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  /// The onBackPressed is for Restrict Android backButton
  Future<bool?> onBackPressed() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'آیا میخواید از برنامه خارج شوید؟',
              style: TextStyle(fontFamily: "Yekanbakh"),
            ),
            // content: const Text('برای خروج از برنامه دکمه بستن را بزنید.'),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: const Text(
                      'بله',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Yekanbakh",
                          color: Colors.green),
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
                          fontSize: 20,
                          fontFamily: "Yekanbakh",
                          color: Colors.red),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ],
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool? result = await onBackPressed();
        result ??= false;
        return result;
      },
      child: Scaffold(
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
                  children: const [
                    Text('text'),
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
          height: 82,
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
      ),
    );
  }
}

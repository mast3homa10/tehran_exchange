import 'dart:io';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/menu_screen.dart';
import '../screens/support_screen.dart';
import '../screens/history_screen.dart';
import '../ui/nav_bar/nav_bar.dart';
import '../constants.dart';
import 'exchange_screen.dart';

class ScreenBody extends StatefulWidget {
  const ScreenBody({Key? key}) : super(key: key);

  @override
  State<ScreenBody> createState() => _ScreenBodyState();
}

class _ScreenBodyState extends State<ScreenBody> {
  int _currentIndex = 2;
  final screens = [
    const MenuScreen(),
    const SupportScreen(),
    ExchangeScreen(),
    const HistoryScreen(),
  ];

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
        resizeToAvoidBottomInset: false,
        appBar: kAppbar,
        body: SafeArea(
          // the indexed stack widget change screen by help of nav bar
          child: IndexedStack(
            children: screens,
            index: _currentIndex,
          ),
        ),
        bottomNavigationBar: Container(
          height: 82,
          decoration:
              BoxDecoration(border: Border.all(width: 1.0, color: Colors.grey)),
          child: BottomNavyBar(
            selectedIndex: _currentIndex,
            showElevation: true,
            itemCornerRadius: 24,
            curve: Curves.easeIn,
            onItemSelected: (index) => setState(() => _currentIndex = index),
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                inactiveColor: Colors.black,
                activeColor: kButtonBackgroundColorLightMode,
                icon: const Icon(FontAwesomeIcons.ellipsisVertical),
                title: const Text('منو'),
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                inactiveColor: Colors.black,
                activeColor: kButtonBackgroundColorLightMode,
                icon: const Icon(FontAwesomeIcons.headset),
                title: const Text('پشتیبانی'),
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                inactiveColor: Colors.black,
                activeColor: kButtonBackgroundColorLightMode,
                icon: const Icon(
                  // ignore: deprecated_member_use
                  FontAwesomeIcons.exchange,
                ),
                title: const Text('مبادله '),
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                inactiveColor: Colors.black,
                activeColor: kButtonBackgroundColorLightMode,
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

class sddfsafadsfadf extends StatefulWidget {
  const sddfsafadsfadf({Key? key}) : super(key: key);

  @override
  State<sddfsafadsfadf> createState() => _sddfsafadsfadfState();
}

class _sddfsafadsfadfState extends State<sddfsafadsfadf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        onItemSelected: (value) {
          print(value);
        },
        items: [
          BottomNavyBarItem(icon: Icon(Icons.add), title: Text('title')),
          BottomNavyBarItem(icon: Icon(Icons.add), title: Text('title')),
          BottomNavyBarItem(icon: Icon(Icons.add), title: Text('title')),
        ],
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../main.dart';
import 'guide_screen.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final controller = Get.put(Controller());

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
        body: Container(
          decoration: const BoxDecoration(
              color: kBackgroundColor,
              image: DecorationImage(
                  image: AssetImage('assets/images/welcomebackground.png'),
                  fit: BoxFit.cover)),
          child: Center(
            child: Container(
              height: 320,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.lightBlue.withOpacity(0.02),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'خوش آمدید به',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Yekanbakh',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  AspectRatio(
                    aspectRatio: 20 / 9,
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                  Text(
                    'تهران اکسچنج',
                    style: kTitleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'صرافی به حد و حصر کریپتو با بیش از 1000 \n'
                    'جفت تجاری سریع و ایمن',
                    style: kDescriptionTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              child: Container(
                height: 62,
                width: 164,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kButtonBackgroundColor,
                    style: BorderStyle.solid,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: const Center(
                  child: Text(
                    'مطالعه راهنما',
                    style: kButtonTextStyle_1,
                  ),
                ),
              ),
              onTap: () {
                Get.to(GuideScreen());
              },
            ),
            GestureDetector(
              onTap: () {
                Get.snackbar('توجه!', "در حال توسعه ...");
              },
              child: Container(
                height: 62,
                width: 164,
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
                    'شروع تبادل',
                    style: kButtonTextStyle_2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

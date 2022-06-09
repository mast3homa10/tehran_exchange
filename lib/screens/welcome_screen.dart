import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../main.dart';
import 'guide_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final controller = Get.put(Controller());

  WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Yekanbakh',
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'صرافی به حد و حصر کریپتو با بیش از 1000 \n'
                  'جفت تجاری سریع و ایمن',
                  style: TextStyle(fontSize: 16, fontFamily: 'Yekanbakh'),
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
                  style: TextStyle(
                      fontFamily: 'Yekanbakh',
                      fontSize: 18,
                      color: kButtonBackgroundColor),
                ),
              ),
            ),
            onTap: () {
              Get.to(const GuideScreen());
            },
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
                color: const Color(0xFFA822E7),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: const Center(
                child: Text(
                  'شروع تبادل',
                  style: TextStyle(
                      fontFamily: 'Yekanbakh',
                      fontSize: 18,
                      color: kBackgroundColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

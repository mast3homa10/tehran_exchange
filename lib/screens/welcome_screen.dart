import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/controller_1.dart';
import '../constants.dart';
import 'guide_screen.dart';
import 'screen_body.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              color: kBackgroundColorLightMode,
              image: DecorationImage(
                  image: AssetImage('assets/images/welcomebackground.png'),
                  fit: BoxFit.cover)),
          child: Center(
            child: Container(
              height: 320,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.lightBlue.withOpacity(0.05),
                    spreadRadius: 15,
                    blurRadius: 27,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'خوش آمدید به',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontFamily: 'Yekanbakh',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.lightBlue.withOpacity(0.1),
                          spreadRadius: 15,
                          blurRadius: 27,
                          offset:
                              const Offset(0, 5), // changes position of shadow
                        ),
                      ],
                      shape: BoxShape.circle,
                    ),
                    child: const AspectRatio(
                      aspectRatio: 20 / 9,
                      child: Image(
                        image: AssetImage('assets/images/logo.png'),
                      ),
                    ),
                  ),
                  const Text(
                    'تهران اکسچنج',
                    style: kTitleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const Text(
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
                    color: kButtonBackgroundColorLightMode,
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
                Get.off(GuideScreen());
              },
            ),
            GestureDetector(
              onTap: () {
                // Get.snackbar('توجه!', "در حال توسعه ...");
                Get.off(const ScreenBody());
              },
              child: Container(
                height: 62,
                width: 164,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kButtonBackgroundColorLightMode,
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

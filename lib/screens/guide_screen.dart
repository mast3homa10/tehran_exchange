import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../components/purple_button.dart';
import '../constants.dart';
import 'home_screen.dart';

class GuideScreen extends StatelessWidget {
  GuideScreen({Key? key}) : super(key: key);
  final introKey = GlobalKey<IntroductionScreenState>();
  final String guideText1 = '1. دریافت مقدار رمزارز و کیف پول\n'
      '2. ارسال ارز برای میادله\n'
      '3. وجه خود را دریافت کنید';

  Widget _buildImage() {
    return Image.asset('assets/images/logo.png', width: 350);
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: const Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16, right: 16),
            child: null,
          ),
        ),
      ),

      pages: [
        PageViewModel(
          title: "تبادل کریپتو در 3 مرحله",
          bodyWidget: Text(
            guideText1,
            style: kDescriptionTextStyle,
          ),
          image: _buildImage(),
          decoration: kPageDecoration,
        ),
        PageViewModel(
          title: "خرید و فروش کریپتو برای فیات",
          bodyWidget: const Text(
            "مبادله وجه با تمامی کارت های عضو شتال",
            style: kDescriptionTextStyle,
          ),
          image: _buildImage(),
          decoration: kPageDecoration,
        ),
        PageViewModel(
          title: "نرخ ثابت برای 20 دقیقه",
          bodyWidget: const Text(
            "اگه مشکلی باشه با ما از طرق چت حلش کنین",
            style: kDescriptionTextStyle,
          ),
          image: _buildImage(),
          decoration: kPageDecoration,
        ),
        PageViewModel(
          title: "پشتیبانی 24 ساعته",
          bodyWidget: const Text(
            "ارتباط با ما از طریق چت",
            style: kDescriptionTextStyle,
          ),
          image: _buildImage(),
          decoration: kPageDecoration,
        ),
      ],
      // onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      showDoneButton: false,
      showBackButton: false,
      showNextButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,

      rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      // skip:
      //     const Text('رد کردن', style: TextStyle(fontWeight: FontWeight.w600)),
      // next: const Icon(Icons.arrow_forward),
      // done: const Text('اتمام', style: TextStyle(fontWeight: FontWeight.w600)),

      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(15.0, 15.0),
        activeColor: kButtonBackgroundColor,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(500.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 80,
        child: Container(
          decoration: const BoxDecoration(color: Color(0xFFEFF4FF)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 10,
                ),
                PurpleButton(
                  titleWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        FontAwesomeIcons.angleRight,
                        color: kBackgroundColor,
                        size: 20,
                      ),
                      Text(
                        'بعدی',
                        style: kButtonTextStyle_2,
                      ),
                    ],
                  ),
                  onPressed: () {
                    /// TODO: set next btn functionality

                    Get.snackbar('توجه!', "در حال توسعه ...");
                  },
                ),
                GestureDetector(
                  child: Container(
                    height: 62,
                    width: 164,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: const Center(
                      child: Text(
                        'بستن راهنما',
                        style: TextStyle(
                            fontFamily: 'Yekanbakh',
                            fontSize: 18,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.to(const HomeScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

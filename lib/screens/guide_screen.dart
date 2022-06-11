import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';

import '../ui/intro/introduction_screen.dart';
import '../ui/intro/model/page_view_model.dart';
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
          decoration: kPageDecorationLightMode,
        ),
        PageViewModel(
          title: "خرید و فروش کریپتو برای فیات",
          bodyWidget: const Text(
            "مبادله وجه با تمامی کارت های عضو شتال",
            style: kDescriptionTextStyle,
          ),
          image: _buildImage(),
          decoration: kPageDecorationLightMode,
        ),
        PageViewModel(
          title: "نرخ ثابت برای 20 دقیقه",
          bodyWidget: const Text(
            "اگه مشکلی باشه با ما از طرق چت حلش کنین",
            style: kDescriptionTextStyle,
          ),
          image: _buildImage(),
          decoration: kPageDecorationLightMode,
        ),
        PageViewModel(
          title: "پشتیبانی 24 ساعته",
          bodyWidget: const Text(
            "ارتباط با ما از طریق چت",
            style: kDescriptionTextStyle,
          ),
          image: _buildImage(),
          decoration: kPageDecorationLightMode,
        ),
      ],
      done: Container(
        height: 62,
        width: 164,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: const Center(
          child: Text(
            'بستن راهنما',
            style: TextStyle(
                fontFamily: 'Yekanbakh', fontSize: 18, color: Colors.black),
          ),
        ),
      ),
      onDone: () {
        Get.off(const HomeScreen());
      }, //_onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      showDoneButton: false,
      showBackButton: false,
      showNextButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,

      rtl: true, // Display as right-to-left
      // skip:
      //     const Text('رد کردن', style: TextStyle(fontWeight: FontWeight.w600)),
      next: Container(
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
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                FontAwesomeIcons.angleRight,
                color: kBackgroundColorLightMode,
                size: 20,
              ),
              Text(
                'بعدی',
                style: kButtonTextStyle_2,
              ),
            ],
          ),
        ),
      ),

      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(15.0, 15.0),
        activeColor: kButtonBackgroundColorLightMode,
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
    );
  }
}

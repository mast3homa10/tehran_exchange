import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../main.dart';
import 'package:introduction_screen/introduction_screen.dart';

// class GuideScreen extends StatelessWidget {
//   final Controller ctrl = Get.find();

//   GuideScreen({Key? key}) : super(key: key);

//   String guideText1 = '1. دریافت مقدار رمزارز و کیف پول\n'
//       '2. ارسال ارز برای میادله\n'
//       '3. وجه خود را دریافت کنید';

//   @override
//   Widget build(context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           color: kBackgroundColor,
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 150.0, right: 20, left: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const AspectRatio(
//                       aspectRatio: 20 / 9,
//                       child: Image(
//                         image: AssetImage('assets/images/logo.png'),
//                       ),
//                     ),
//                     const Text(
//                       'تبادل کریپتو در 3 مرحله',
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontFamily: 'Yekanbakh',
//                       ),
//                       textAlign: TextAlign.start,
//                     ),
//                     Text(
//                       guideText1,
//                       style: const TextStyle(
//                           fontSize: 16, fontFamily: 'Yekanbakh'),
//                       textAlign: TextAlign.start,
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(color: Color(0xFFEFF4FF)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       GestureDetector(
//                         child: Container(
//                           height: 62,
//                           width: 164,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: kButtonBackgroundColor,
//                               style: BorderStyle.solid,
//                               width: 2.0,
//                             ),
//                             color: const Color(0xFFA822E7),
//                             borderRadius: BorderRadius.circular(30.0),
//                           ),
//                           child: Center(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: const [
//                                 Text(
//                                   'بعدی',
//                                   style: TextStyle(
//                                       fontFamily: 'Yekanbakh',
//                                       fontSize: 18,
//                                       color: kBackgroundColor),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         onTap: () {
//                           Get.to(GuideScreen());
//                         },
//                       ),
//                       GestureDetector(
//                         child: Container(
//                           height: 62,
//                           width: 164,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(30.0),
//                           ),
//                           child: const Center(
//                             child: Text(
//                               'بستن راهنما',
//                               style: TextStyle(
//                                   fontFamily: 'Yekanbakh',
//                                   fontSize: 18,
//                                   color: Colors.black),
//                             ),
//                           ),
//                         ),
//                         onTap: () {},
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class GuideScreen extends StatefulWidget {
  const GuideScreen({Key? key}) : super(key: key);

  @override
  _GuideScreenState createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  String guideText1 = '1. دریافت مقدار رمزارز و کیف پول\n'
      '2. ارسال ارز برای میادله\n'
      '3. وجه خود را دریافت کنید';
  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  Widget _buildImage() {
    return Image.asset('assets/images/logo.png', width: 350);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

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
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
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
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'بعدی',
                            style: TextStyle(
                                fontFamily: 'Yekanbakh',
                                fontSize: 18,
                                color: kBackgroundColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.to(GuideScreen());
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
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "تبادل کریپتو در 3 مرحله",
          body: guideText1,
          image: _buildImage(),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "خرید و فروش کریپتو برای فیات",
          body: "مبادله وجه با تمامی کارت های عضو شتال",
          image: _buildImage(),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "نرخ ثابت برای 20 دقیقه",
          body: "اگه مشکلی باشه با ما از طرق چت حلش کنین",
          image: _buildImage(),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "پشتیبانی 24 ساعته",
          body: "ارتباط با ما از طریق چت",
          image: _buildImage(),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip:
          const Text('رد کردن', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('اتمام', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text("This is the screen after Introduction")),
    );
  }
}

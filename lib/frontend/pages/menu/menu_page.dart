import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../toggel_bar.dart';
import '../../pages/menu/menu_page_controller.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);
  final sliderItems = const [
    AspectRatio(
      aspectRatio: 20 / 9,
      child: Image(
        image: AssetImage('assets/images/logo.png'),
      ),
    ),
    AspectRatio(
      aspectRatio: 20 / 9,
      child: Image(
        image: AssetImage('assets/images/logo.png'),
      ),
    ),
    AspectRatio(
      aspectRatio: 20 / 9,
      child: Image(
        image: AssetImage('assets/images/logo.png'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (MenuPageController controller) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.3,
              child: Center(
                child: Column(
                  children: [
                    CarouselSlider(
                      items: sliderItems,
                      options: CarouselOptions(
                          height: 150,
                          autoPlay: true,
                          onPageChanged: (index, reason) =>
                              controller.changeSliderItem(index)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DotsIndicator(
                        dotsCount: sliderItems.length,
                        position: controller.sliderItemIndex.toDouble(),
                        decorator: DotsDecorator(
                          size: const Size(10.0, 10.0),
                          color: Theme.of(context).appBarTheme.backgroundColor!,
                          activeSize: const Size(15.0, 15.0),
                          activeColor: Theme.of(context).backgroundColor,
                          activeShape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(500.0)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.12,
              child: ToggleBar(
                  w: 110,
                  labels: const ['پشتیبانی', 'سرویس', 'تنظیمات'],
                  backgroundBorder: Border.all(width: 0.0),
                  onSelectionUpdated: (index) =>
                      controller.changeMeneItemIndex(index)),
            ),
            SizedBox(
              height: Get.height * 0.34,
              child: IndexedStack(
                index: controller.menuItemIndex.toInt(),
                children: [
                  SupportMenuPage(),
                  ServiceMenuPage(),
                  SettingMenuPage(),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class SupportMenuPage extends StatelessWidget {
  SupportMenuPage({
    Key? key,
  }) : super(key: key);
  final menu = [
    const CustomMenuItem(
        label: 'آموزش استفاده', icon: FontAwesomeIcons.bookOpenReader),
    const CustomMenuItem(
        label: 'سوالات متداول', icon: FontAwesomeIcons.circleQuestion),
    const CustomMenuItem(label: 'گذاشتن نظر', icon: FontAwesomeIcons.comment),
    const CustomMenuItem(
        label: 'شرایط و قوانین', icon: FontAwesomeIcons.circleExclamation),
    const CustomMenuItem(
        label: 'حریم خصوصی', icon: FontAwesomeIcons.circleExclamation),
    const CustomMenuItem(
        label: 'ریسک افشای اطلاعات', icon: FontAwesomeIcons.circleExclamation),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menu.length,
      itemBuilder: (context, index) => menu[index],
    );
  }
}

class CustomMenuItem extends StatelessWidget {
  const CustomMenuItem({
    Key? key,
    this.label = '',
    this.icon = Icons.add,
  }) : super(key: key);
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Icon(icon),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  style: ButtonStyle(
                      side: MaterialStateProperty.all<BorderSide>(BorderSide(
                          width: 0,
                          color: Theme.of(context).scaffoldBackgroundColor))),
                  onPressed: () {
                    Get.snackbar('توجه!', 'در حال توسعه ...');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        label,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontWeight: FontWeight.bold,
                              // color: Theme.of(context).dividerTheme.color
                            ),
                      ),
                      Icon(
                        FontAwesomeIcons.angleLeft,
                        color: Theme.of(context).iconTheme.color,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                  height: 0,
                  endIndent: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SettingMenuPage extends StatelessWidget {
  SettingMenuPage({
    Key? key,
  }) : super(key: key);
  final menu = [
    const CustomMenuItem(label: 'نوتیفیکیشن ها', icon: FontAwesomeIcons.bell),
    const CustomMenuItem(
      label: 'رمز عبور',
      icon: FontAwesomeIcons.lock,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menu.length,
      itemBuilder: (context, index) => menu[index],
    );
  }
}

class ServiceMenuPage extends StatelessWidget {
  ServiceMenuPage({
    Key? key,
  }) : super(key: key);
  final menu = [
    const CustomMenuItem(label: 'دفترچه آدرس', icon: FontAwesomeIcons.bookOpen),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menu.length,
      itemBuilder: (context, index) => menu[index],
    );
  }
}

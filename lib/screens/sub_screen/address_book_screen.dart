import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tehran_exchange/components/custom_big_button.dart';
import 'package:tehran_exchange/ui/nav_bar/second_nav_bar.dart';

import '../../constants.dart';

class AddressBookScreen extends StatefulWidget {
  const AddressBookScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddressBookScreen> createState() => _AddressBookScreenState();
}

class _AddressBookScreenState extends State<AddressBookScreen> {
  int currentIndex = 0;
  final subScreen = [
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8.0),
          height: 112,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: SizedBox(
            child: Center(
                child: Column(
              children: [
                SizedBox(
                  width: Get.width,
                  height: Get.height * 0.15,
                  child: TopNavBar(
                    selectedIndex: currentIndex,
                    showElevation: true,
                    itemCornerRadius: 24,
                    curve: Curves.easeIn,
                    onItemSelected: (index) =>
                        setState(() => currentIndex = index),
                    items: <TopNavBarItem>[
                      TopNavBarItem(
                        inactiveColor: Colors.black,
                        activeColor: kLightButtonColor,
                        icon: const Icon(FontAwesomeIcons.qrcode),
                        isIconShow: false,
                        title: const Text('مورد علاقه'),
                        textAlign: TextAlign.center,
                      ),
                      TopNavBarItem(
                        inactiveColor: Colors.black,
                        activeColor: kLightButtonColor,
                        icon: const Icon(FontAwesomeIcons.wallet),
                        isIconShow: false,
                        title: const Text('کیف پول های اخیر'),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                subScreen[currentIndex],
              ],
            )),
          ),
        ),
        SizedBox(height: Get.height / 3.53),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: CustomBigButton(
            label: 'اضافه کردن کیف پول',
            onPressed: () {
              Get.snackbar('توجه!', "در حال توسعه ...");
            },
          ),
        ),
      ],
    ));
  }
}

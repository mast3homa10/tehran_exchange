import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../components/custom_big_button.dart';
import '../../components/exchange_box.dart';
import '../../controllers/controller_1.dart';
import '../../constants.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final Controller controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // the padding widget below contains ''' cryptocurrency calculator '''.
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /// first box
              const ExchangeBox(
                title: 'Tether',
                cryptoTitle: 'USDT',
                iconColour: Colors.green,
              ),
              // calculate button
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text('BTC ~ '),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: const [
                                Text(
                                  '2313645661',
                                ),
                                Icon(FontAwesomeIcons.circleArrowDown,
                                    color: Colors.white),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: kChangerContainerColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: const Color(0xFFEEEEEE),
                            style: BorderStyle.solid,
                            width: 0.8,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              FontAwesomeIcons.arrowUp,
                              size: 20,
                              color: Colors.white,
                            ),
                            Icon(
                              FontAwesomeIcons.arrowDown,
                              size: 20,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Get.snackbar("توجه !", "در حال توسعه ...");
                      },
                    ),
                  ],
                ),
              ),
              // second box
              const ExchangeBox(
                title: "Bitcoin",
                cryptoTitle: "BTC",
                isHaveIcon: true,
                iconColour: Colors.orange,
              ),
            ],
          ),
        ),
        SizedBox(height: Get.height / 5),
        // the padding widget below contains '''add address button'''.
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: CustomBigButton(
            label: 'وارد کردن آدرس',
            onPressed: () {
              // Get.snackbar('توجه!', "در حال توسعه ...");
              controller.changeScreen();
            },
          ),
        ),
      ],
    );
  }
}

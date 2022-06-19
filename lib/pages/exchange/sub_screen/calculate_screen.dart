import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tehran_exchange/pages/exchange/exchange_page_controller.dart';

import '../../../components/exchange_box.dart';
import '../../../components/convert_button.dart';
import '../../../components/custom_big_button.dart';

class CalculatePage extends GetView<ExchangePageController> {
  CalculatePage({
    Key? key,
  }) : super(key: key);

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
              // calculate result
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'BTC ~ ',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Text(
                                  '2313645661',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.0,
                                      ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(FontAwesomeIcons.circleArrowDown,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    //  convret button
                    const ConvretButton(),
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

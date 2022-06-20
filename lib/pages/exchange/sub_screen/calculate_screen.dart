import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tehran_exchange/constants.dart';
import 'package:tehran_exchange/pages/exchange/exchange_page_controller.dart';

import '../../../components/exchange_box.dart';
import '../../../components/convert_button.dart';
import '../../../components/custom_big_button.dart';

class CalculatePage extends GetView<ExchangePageController> {
  const CalculatePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // the padding widget below contains ''' cryptocurrency calculator '''.
        SizedBox(
          height: Get.height * 0.4,
          child: Padding(
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
                          buildFixer(context),
                        ],
                      ),
                      //  convert button
                      const ConvertButton(),
                    ],
                  ),
                ),
                // second box
                ExchangeBox(
                  title: "Bitcoin",
                  cryptoTitle: "BTC",
                  isHaveIcon: true,
                  iconColour: Colors.orange,
                  isIconChange: controller.isIconChange.toInt(),
                  openIconPressed: () {
                    controller.changeIcon();
                    // Get.rawSnackbar(
                    //   onTap: (_) {
                    //     Get.closeAllSnackbars();
                    //   },
                    //   titleText: Column(
                    //     children: [
                    //       Container(
                    //         height: 5,
                    //         width: 40,
                    //         decoration: BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius: BorderRadius.circular(20)),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: Text(
                    //           'این یک نرخ مورد انتظار است',
                    //           style: Theme.of(context).textTheme.headline3,
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    //   duration: const Duration(seconds: 30),
                    //   borderRadius: 20,
                    //   backgroundColor: const Color(0xFF040507),
                    //   message:
                    //       'تغییر اکنون بهترین نرخرا برای شما در لحظه مبادله انتخاب می کند'
                    //       '\n هزینه های شبکه و سایر هزینه های مبادله در نرخ گنجانده شده است'
                    //       '\n ما هییچ هزنیه اضافی را تضمین نمی کنیم .',
                    // );
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(50),
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        context: context,
                        builder: (builder) {
                          return Container(
                            height: Get.height * 0.3,
                            color: Colors.black,
                            child: Center(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 5,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'این یک نرخ مورد انتظار است',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'تغییر اکنون بهترین نرخرا برای شما در لحظه مبادله انتخاب می کند'
                                      '\n هزینه های شبکه و سایر هزینه های مبادله در نرخ گنجانده شده است'
                                      '\n ما هییچ هزنیه اضافی را تضمین نمی کنیم .',
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  closeIconPressed: () {
                    controller.changeIcon();
                  },
                ),
              ],
            ),
          ),
        ),

        SizedBox(
          height: Get.height < 700 ? Get.height * 0.195 : Get.height * 0.165,
        ),
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

  Widget buildFixer(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Text(
                  '231364561',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
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
        ),
        if (controller.isIconChange.toInt() == 1)
          Container(
              margin: const EdgeInsets.all(3.0),
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: kLightButtonColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(FontAwesomeIcons.clock),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 3.0, left: 3.0, right: 3.0),
                    child: Text(
                      '14:00',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            letterSpacing: 1.0,
                          ),
                    ),
                  )
                ],
              )),
      ],
    );
  }
}
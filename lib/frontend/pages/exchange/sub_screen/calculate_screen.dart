import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../frontend/pages/exchange/controllers/timer_controller.dart';
import '../../../../frontend/components/try_again_button.dart';
import '../../../../frontend/components/custom_search_delegate.dart';
import '../../../../constants.dart';
import '../../../components/exchange_box.dart';
import '../../../components/convert_button.dart';
import '../../../components/custom_big_button.dart';
import '../controllers/exchange_page_controller.dart';

class CalculatePage extends StatelessWidget {
  CalculatePage({
    Key? key,
  }) : super(key: key);
  final timerController = Get.put(TimerController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExchangePageController>(
      builder: (controller) {
        return !controller.connectToNetwork.isTrue
            ? TryAgainButton()
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // the Expanded widget below contains ''' cryptocurrency calculator '''.
                  Expanded(
                    child: SizedBox(
                      height: Get.height * 0.4,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            /// first box
                            ExchangeBox(
                              onPressed: () {
                                // launch searchbox by tap here
                                showSearch(
                                    context: context,
                                    delegate: CustomSearchDelegate(item: 0));
                              },
                              currencyEnglishName: controller
                                  .firstCurrencyChoiceEnglishName
                                  .toString(),
                              currencySymbol: controller
                                  .firstCurrencyChoiceSymbol
                                  .toString()
                                  .toUpperCase(),
                              imgUrl: controller.firstCurrencyChoiceImageUrl
                                  .toString(),
                            ),
                            // calculate result
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'BTC ~ ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                fontWeight: FontWeight.w700),
                                      ),
                                      buildFixer(context, controller),
                                    ],
                                  ),
                                  //  convert button
                                  const ConvertButton(),
                                ],
                              ),
                            ),
                            // second box
                            ExchangeBox(
                              onPressed: () {
                                // launch searchbox by tap here
                                showSearch(
                                    context: context,
                                    delegate: CustomSearchDelegate(
                                        item: 1,
                                        inputStyle: InputDecorationTheme(
                                            labelStyle: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                            focusColor: Colors.white,
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .headline4)));
                              },
                              search: controller.searchController.toInt(),
                              currencyEnglishName: controller
                                  .secondCurrencyChoiceEnglishName
                                  .toString(),
                              currencySymbol: controller
                                  .secondCurrencyChoiceSymbol
                                  .toString()
                                  .toUpperCase(),
                              isHaveIcon: true,
                              imgUrl: controller.secondCurrencyChoiceImageUrl
                                  .toString(),
                              isIconChange: controller.isIconChange.toInt(),
                              openIconPressed: () {
                                buildSnakBar(context);

                                controller.changeIcon();
                              },
                              closeIconPressed: () {
                                controller.changeIcon();

                                timerController.stopTimer();
                                // timerController.timer!.cancel();
                                // timerController.seconds = kMaxSeconds.obs;
                                // timerController.update();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // the padding widget below contains '''add address button'''.
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CustomBigButton(
                      label: 'وارد کردن آدرس',
                      onPressed: () {
                        // Get.snackbar('توجه!', "در حال توسعه ...");
                        if (timerController.timer != null) {
                          timerController.timer!.cancel();
                          timerController.seconds = kMaxSeconds.obs;
                          timerController.update();
                        }

                        controller.changeScreen();
                      },
                    ),
                  ),
                ],
              );
      },
    );
  }

  void buildSnakBar(BuildContext context) {
    showModalBottomSheet(
        isDismissible: true,
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
            color: Theme.of(context).bottomSheetTheme.backgroundColor,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 5,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Theme.of(context).dividerTheme.color,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'این یک نرخ مورد انتظار است',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'تغییر اکنون بهترین نرخرا برای شما در لحظه مبادله انتخاب می کند'
                      '\n هزینه های شبکه و سایر هزینه های مبادله در نرخ گنجانده شده است'
                      '\n ما هییچ هزنیه اضافی را تضمین نمی کنیم .',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget buildFixer(BuildContext context, ExchangePageController controller) {
    return Row(children: [
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
                child:
                    Icon(FontAwesomeIcons.circleArrowDown, color: Colors.white),
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
                borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
              const Icon(FontAwesomeIcons.clock),
              MyTimer(
                maxSecond: 120,
                controller: timerController,
              ),
            ])),
    ]);
  }
}

class MyTimer extends StatelessWidget {
  const MyTimer(
      {Key? key, this.maxSecond = kMaxSeconds, required this.controller})
      : super(key: key);
  final int maxSecond;
  final TimerController controller;

  @override
  Widget build(BuildContext context) {
    controller.setTimer(maxSecond);
    controller.startTimer();
    return Padding(
      padding: const EdgeInsets.only(top: 3.0, left: 3.0, right: 3.0),
      child: Obx(
        () => SizedBox(
          width: 50,
          child: Center(
            child: Text(
              '${((controller.seconds.toInt() / 60).truncate() % 60).toString().padLeft(2, '0')}:${(controller.seconds.toInt() % 60).toString().padLeft(2, '0')}',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    letterSpacing: 1.0,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

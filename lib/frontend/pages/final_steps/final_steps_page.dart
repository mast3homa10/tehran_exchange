import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tehran_exchange/frontend/pages/final_steps/final_steps_page_controller.dart';

import '../../../constants.dart';
import '../../../frontend/pages/exchange/controllers/timer_controller.dart';
import '../../../frontend/pages/exchange/sub_screen/calculate_screen.dart';

class FinalStepsPage extends GetView<FinalStepsController> {
  FinalStepsPage({Key? key}) : super(key: key);

  final TimerController timerController = TimerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppbar,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).appBarTheme.backgroundColor),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: Get.width * 0.1, right: Get.width * 0.1),
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(maxHeight: 40, maxWidth: Get.width),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.stepslable.length,
                          itemBuilder: (context, index) => SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      controller.stepslable[index],
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                  ),
                                ),
                                if (index < controller.steps.length - 1)
                                  SizedBox(
                                    width: Get.width * 0.2,
                                    child: const Divider(
                                      color: Colors.green,
                                      thickness: 10,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'زمان باقی مانده برای ارسال ',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    MyTimer(maxSecond: 600),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'مقدار واریزی توسط شما: ',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                    Container(
                      height: 60,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.paste),
                              ),
                              VerticalDivider(
                                width: 10.0,
                                thickness: 2.0,
                              ),
                            ],
                          ),
                          Text(
                            'daf948hewprhtwg6546werrt45',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'لطفا BNB(BCB) مشخض شده را به آدرس زیر واریز نمایید: ',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                    Container(
                      height: 60,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.paste),
                              ),
                              VerticalDivider(
                                width: 10.0,
                                thickness: 2.0,
                              ),
                            ],
                          ),
                          Text(
                            'daf948hewprhtwg6546werrt45',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(8.0),
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).appBarTheme.backgroundColor),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'به اشتراک گذاری',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          const Icon(Icons.share)
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(8.0),
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).appBarTheme.backgroundColor),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'مشاهده بارکد QR',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          const Icon(Icons.qr_code)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ExpansionTile(
                title: Text('مقدار USTD(TRX) دریافتی شما',
                    style: Theme.of(context).textTheme.headline4),
                children: <Widget>[
                  Align(
                    child: Text(' آدرس کیف پول USDT(TRX) شما: ',
                        style: Theme.of(context).textTheme.headline4),
                    alignment: Alignment.center,
                  ),
                ])
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        decoration:
            BoxDecoration(color: Theme.of(context).appBarTheme.backgroundColor),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'آی دی معامله شما: ',
                style: Theme.of(context).textTheme.headline4,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).scaffoldBackgroundColor),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.copy),
                        Text(
                          'datdsafaffgafsdfefaea',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

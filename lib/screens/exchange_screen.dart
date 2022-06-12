import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tehran_exchange/models/currency_model.dart';

import '../constants.dart';

class ExchangeScreen extends StatelessWidget {
  ExchangeScreen({Key? key}) : super(key: key);
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // the padding widget below contains ''' cryptocurrency calculator '''.
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const ExchangeContainer(
                  title: 'Tether',
                  cryptoTitle: 'USDT',
                  colour: Colors.green,
                ),
                GestureDetector(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
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
                  ),
                  onTap: () {
                    Get.snackbar("توجه !", "در حال توسعه ...");
                  },
                ),
                const ExchangeContainer(
                  title: "Bitcoin",
                  cryptoTitle: "BTC",
                  colour: Colors.orange,
                ),
              ],
            ),
          ),
          SizedBox(height: Get.height / 5),
          // the padding widget below contains '''add address button'''.
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
                child: Container(
                  height: 62,
                  width: 403,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kButtonBackgroundColorLightMode,
                      style: BorderStyle.solid,
                      width: 2.0,
                    ),
                    color: const Color(0xFFA822E7),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: const Center(
                      child: Text(
                    'وارد کردن آدرس',
                    style: kButtonTextStyle_2,
                  )),
                ),
                onTap: () {
                  Get.snackbar('توجه!', "در حال توسعه ...");
                }),
          ),
        ],
      ),
    );
  }
}

class ExchangeContainer extends StatelessWidget {
  const ExchangeContainer(
      {Key? key,
      this.title = '',
      this.cryptoTitle = '',
      this.colour = Colors.white})
      : super(key: key);
  final String title;
  final String cryptoTitle;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFEEEEEE),
          style: BorderStyle.solid,
          width: 2.0,
        ),
        color: kChangerContainerColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              FontAwesomeIcons.bitcoin,
              color: colour,
              size: 30,
            ),
            const SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    child: Row(
                      textBaseline: TextBaseline.ideographic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          cryptoTitle,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                        const Icon(FontAwesomeIcons.angleDown,
                            color: Colors.white),
                      ],
                    ),
                    onTap: () {
                      // Get.snackbar('title', 'message');
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => CurrencyListScreen(),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const VerticalDivider(
              color: Color(0xFFFFFFFF),
              indent: 9,
              endIndent: 9,
            ),
            SizedBox(
              width: 150,
              // todo: fix this textfield
              child: TextField(
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'Yekanbakh', fontSize: 20),
                decoration: const InputDecoration(
                  hintText: 'مقدار را وارد کنید ...',
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Yekanbakh',
                      fontSize: 20),
                ),
                onChanged: (value) {
                  print(value);
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}

class CurrencyListScreen extends StatelessWidget {
  const CurrencyListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          children: [
            IconButton(
              icon: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, border: Border.all(width: 2)),
                  child: Icon(FontAwesomeIcons.multiply)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFEEEEEE),
                  style: BorderStyle.solid,
                  width: 2.0,
                ),
                color: kChangerContainerColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,

                      // todo: fix this textfield
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Yekanbakh',
                              fontSize: 20),
                          cursorColor: Colors.white,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: 'جست و جو',
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Yekanbakh',
                                fontSize: 20),
                          ),
                          onChanged: (value) {
                            print(value);
                          },
                        ),
                      ),
                    ),
                    const Icon(
                      FontAwesomeIcons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              )),
            ),
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, i) => SizedBox(
                  height: 50,
                  width: 50,
                  child: Container(
                      child: Row(
                    children: [
                      Text(dataList[i].name!),
                    ],
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

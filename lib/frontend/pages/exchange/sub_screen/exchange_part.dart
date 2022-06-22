import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../components/custom_big_button.dart';
import '../exchange_page_controller.dart';
import 'qr_code_screen.dart';

class ExchangePart extends GetView<ExchangePageController> {
  const ExchangePart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Get.height * 0.37,
          child: Column(
            children: [
              PasteAddressContainer(
                hintText: 'وارد کردن آدرس',
                onPressed: () {
                  Get.snackbar('توجه!', 'در حال توسعه ...');
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0, left: 18.0),
                    child: GestureDetector(
                      child: Text(
                        'کیف پول ندارید؟',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      onTap: () {
                        Get.snackbar('توجه!', 'در حال توسعه ...');
                      },
                    ),
                  ),
                ],
              ),
              PasteAddressContainer(
                hintText: ' وارد کردن آدرس پشتیبان',
                onPressed: () {
                  Get.snackbar('توجه!', 'در حال توسعه ...');
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: Get.height < 700 ? Get.height * 0.1 : Get.height * 0.15,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: CustomBigButton(
            label: 'شروع تبادل',
            onPressed: () {
              // kmessage;
              controller.changeScreen();
              // Network().postUser();
            },
          ),
        ),
      ],
    );
  }
}

class PasteAddressContainer extends StatelessWidget {
  const PasteAddressContainer({
    Key? key,
    this.hintText = '',
    required this.onPressed,
  }) : super(key: key);
  final String hintText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color:
              Theme.of(context).dividerTheme.color ?? const Color(0xFFEEEEEE),
          style: BorderStyle.solid,
          width: 2.0,
        ),
        color: Theme.of(context).appBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)))),
                child: Text(
                  "چسباندن",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontFamily: "Yekabakh",
                      color: Theme.of(context).scaffoldBackgroundColor),
                ),
                onPressed: onPressed,
              ),
            ),
            const VerticalDivider(
              color: Color(0xFFFFFFFF),
              indent: 9,
              endIndent: 9,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Yekanbakh',
                      fontSize: 20),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Theme.of(context).dividerTheme.color),
                  ),
                  onChanged: (value) {},
                ),
              ),
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.qrcode),
              onPressed: () {
                Get.to(const QRCodeScreen());
              },
            )
          ],
        ),
      )),
    );
  }
}

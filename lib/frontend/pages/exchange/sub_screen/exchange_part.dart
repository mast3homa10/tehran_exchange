import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../final_steps/final_steps_page.dart';
import '../../../components/custom_big_button.dart';
import '../controllers/exchange_page_controller.dart';
import 'qr_code_screen.dart';

class ExchangePart extends StatefulWidget {
  const ExchangePart({
    Key? key,
  }) : super(key: key);

  @override
  State<ExchangePart> createState() => _ExchangePartState();
}

class _ExchangePartState extends State<ExchangePart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Get.height * 0.37,
          child: Column(
            children: [
              const PasteAddressContainer(
                hintText: 'وارد کردن آدرس',
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
              const PasteAddressContainer(
                hintText: ' وارد کردن آدرس پشتیبان',
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
              // controller.changeScreen();
              Get.to(() => FinalStepsPage());
            },
          ),
        ),
      ],
    );
  }
}

class PasteAddressContainer extends StatefulWidget {
  const PasteAddressContainer({
    Key? key,
    this.hintText = '',
  }) : super(key: key);
  final String hintText;

  @override
  State<PasteAddressContainer> createState() => _PasteAddressContainerState();
}

class _PasteAddressContainerState extends State<PasteAddressContainer> {
  final exchangeController = Get.find<ExchangePageController>();
  TextEditingController textEditingController = TextEditingController();
  String pasteValue = '';

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
            // paset button
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
                onPressed: () {},
              ),
            ),
            const VerticalDivider(
              color: Color(0xFFFFFFFF),
              indent: 9,
              endIndent: 9,
            ),
            // input for address
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Yekanbakh',
                      fontSize: 20),
                  decoration: InputDecoration(
                    hintMaxLines: 3,
                    hintText: widget.hintText,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Theme.of(context).dividerTheme.color),
                  ),
                  onChanged: (value) {},
                ),
              ),
            ),
            // scan qrcode icon
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

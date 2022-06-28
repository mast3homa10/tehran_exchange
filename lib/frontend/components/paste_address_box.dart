import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';

import '../../frontend/pages/exchange/controllers/exchange_page_controller.dart';
import '../../frontend/pages/exchange/sub_screen/qr_code_screen.dart';

class PasteAddressBox extends StatefulWidget {
  const PasteAddressBox({
    Key? key,
    this.hintText = '',
  }) : super(key: key);
  final String hintText;

  @override
  State<PasteAddressBox> createState() => _PasteAddressBoxState();
}

class _PasteAddressBoxState extends State<PasteAddressBox> {
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

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../pages/exchange/controllers/exchange_page_controller.dart';

class TryAgainButton extends StatelessWidget {
  TryAgainButton({
    Key? key,
  }) : super(key: key);
  final exchangeController = Get.find<ExchangePageController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: ButtonStyle(
                side: MaterialStateProperty.all<BorderSide>(BorderSide(
                    width: 0,
                    color: Theme.of(context).scaffoldBackgroundColor))),
            onPressed: () {
              exchangeController.checkConnection();
            },
            child: Column(
              children: const [
                Icon(FontAwesomeIcons.arrowRotateRight),
                Text('تلاش مجدد'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

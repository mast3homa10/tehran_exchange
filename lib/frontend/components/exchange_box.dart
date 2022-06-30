import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tehran_exchange/backend/models/currency_model.dart';
import 'package:tehran_exchange/backend/network_constants.dart';

import '../../constants.dart';
import '../pages/exchange/controllers/exchange_page_controller.dart';

class CalculateBox extends StatelessWidget {
  const CalculateBox({
    Key? key,
    this.search = 0,
    this.currency,
    this.isHaveIcon = false,
    this.isIconChange = false,
    this.onPressed,
    this.openIconPressed,
    this.closeIconPressed,
  }) : super(key: key);
  final CurrencyModel? currency;
  final int search;
  final bool isHaveIcon;
  final bool isIconChange;
  final VoidCallback? openIconPressed;
  final VoidCallback? closeIconPressed;
  final VoidCallback? onPressed;

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
          child: Row(
        children: [
          SizedBox(
            width: Get.width * 0.35,
            child: Column(
              children: [
                // start search page by click the following text button
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(17),
                      ),
                    ),
                    child: TextButton(
                      onPressed: onPressed,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey.withOpacity(0.2)),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                              const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(17)))),
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(
                                  width: 0,
                                  color: Theme.of(context)
                                          .appBarTheme
                                          .backgroundColor ??
                                      Theme.of(context)
                                          .scaffoldBackgroundColor))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // image part

                          Row(
                            children: [
                              if (currency!.symbol!.length < 8)
                                AspectRatio(
                                  aspectRatio: 11 / 9,
                                  child: SvgPicture.network(
                                    imgUrl + '${currency!.legacyTicker}.svg',
                                    semanticsLabel: 'A shark?!',
                                    placeholderBuilder:
                                        (BuildContext context) => Container(),
                                  ),
                                ),
                              Text(
                                currency!.symbol!.toUpperCase(),
                                style: Theme.of(context).textTheme.headline5,
                                maxLines: 1,
                                textWidthBasis: TextWidthBasis.longestLine,
                              ),
                            ],
                          ),
                          Icon(
                            FontAwesomeIcons.angleDown,
                            color: Theme.of(context).dividerTheme.color,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(1.0),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(17),
                        ),
                        color: kNetworkColorList[
                                currency!.inNetwork!.toLowerCase()] ??
                            Colors.grey),
                    child: Center(
                      child: Text(
                        currency!.inNetwork!.toUpperCase(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const VerticalDivider(
            width: 2.0,
            thickness: 1.0,
            indent: 3,
            endIndent: 3,
          ),
          // following part is for provide for fixer.
          buildFixIcon(context),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GetBuilder<ExchangePageController>(builder: (controller) {
                return TextFormField(
                  initialValue: search == 1
                      ? controller.estimate!.destinationAmount.toString()
                      : controller.estimate!.sourceAmount!.toString(),
                  // input amount from user
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).appBarTheme.backgroundColor ??
                                    Colors.greenAccent,
                            width: 0.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).appBarTheme.backgroundColor ??
                                    Colors.red,
                            width: 5.0),
                      ),
                      hintText: 'مقدار را وارد کنید',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(
                              color: Theme.of(context).dividerTheme.color)),
                  onChanged: (value) {},
                );
              }),
            ),
          )
        ],
      )),
    );
  }

//
  Widget? buildImage(String? legacyTicker) {
    try {
      return AspectRatio(
        aspectRatio: 0.35,
        child: SvgPicture.network(
          imgUrl + '$legacyTicker.svg',
          semanticsLabel: 'A shark?!',
          placeholderBuilder: (BuildContext context) => Container(),
        ),
      );
    } catch (e) {
      log('$e');
    }
  }

  Widget buildFixIcon(BuildContext context) {
    if (isHaveIcon) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: isIconChange
            ? IconButton(
                onPressed: closeIconPressed,
                icon: Icon(
                  CupertinoIcons.lock,
                  color: Theme.of(context).backgroundColor,
                ),
              )
            : IconButton(
                onPressed: openIconPressed,
                icon: Icon(
                  CupertinoIcons.lock_open,
                  color: Theme.of(context).dividerTheme.color,
                ),
              ),
      );
    } else {
      return Container();
    }
  }
}

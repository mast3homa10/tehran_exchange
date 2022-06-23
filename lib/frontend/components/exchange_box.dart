import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../frontend/pages/exchange/exchange_page_controller.dart';

class ExchangeBox extends GetView<ExchangePageController> {
  const ExchangeBox({
    Key? key,
    this.currencyEnglishName = '',
    this.search = 0,
    this.currencySymbol = '',
    this.isHaveIcon = false,
    this.imgUrl,
    this.isIconChange = 0,
    this.onPressed,
    this.openIconPressed,
    this.closeIconPressed,
  }) : super(key: key);

  final String currencyEnglishName;
  final int search;
  final String? imgUrl;
  final String currencySymbol;
  final bool isHaveIcon;
  final int isIconChange;
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
            child: Row(
              children: [
                // image part
                Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: buildImage(imgUrl)),
                // start search page by click the following text button
                Expanded(
                  child: TextButton(
                    onPressed: onPressed,
                    style: ButtonStyle(
                        side: MaterialStateProperty.all<BorderSide>(BorderSide(
                            width: 0,
                            color: Theme.of(context)
                                    .appBarTheme
                                    .backgroundColor ??
                                Theme.of(context).scaffoldBackgroundColor))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // currency English Name
                        Text(
                          currencyEnglishName,
                          style: Theme.of(context).textTheme.headline5,
                          maxLines: 1,
                          textWidthBasis: TextWidthBasis.longestLine,
                        ),
                        Row(
                          textBaseline: TextBaseline.ideographic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // currency Symbol
                            Text(
                              currencySymbol,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Icon(
                              FontAwesomeIcons.angleDown,
                              color: Theme.of(context).dividerTheme.color,
                              size: 18,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const VerticalDivider(
            width: 10.0,
            thickness: 1.0,
            indent: 9,
            endIndent: 9,
          ),
          // following part is for provide for fixer.
          buildFixer(context),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
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
                        .copyWith(color: Theme.of(context).dividerTheme.color)),
                onChanged: (value) {},
              ),
            ),
          )
        ],
      )),
    );
  }

//
  Widget? buildImage(String? imageUrl) {
    try {
      return AspectRatio(
        aspectRatio: 0.35,
        child: SvgPicture.network(
          imageUrl!,
          semanticsLabel: 'A shark?!',
          placeholderBuilder: (BuildContext context) => Container(),
        ),
      );
    } catch (e) {
      log('$e');
    }
  }

  Widget buildFixer(BuildContext context) {
    if (isHaveIcon) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: isIconChange == 1
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

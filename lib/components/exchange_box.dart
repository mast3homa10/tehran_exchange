import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import 'custom_search_delegate.dart';

class ExchangeBox extends StatelessWidget {
  const ExchangeBox(
      {Key? key,
      this.title = '',
      this.cryptoTitle = '',
      this.isHaveIcon = false,
      this.iconColour = Colors.white})
      : super(key: key);
  final String title;
  final String cryptoTitle;
  final Color iconColour;
  final bool isHaveIcon;

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
        color: kLightChangerColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              FontAwesomeIcons.bitcoin,
              color: iconColour,
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
                      // launch searchbox by tap here
                      showSearch(
                          context: context, delegate: CustomSearchDelegate());
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
            if (isHaveIcon)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  FontAwesomeIcons.unlockKeyhole,
                  color: Colors.white,
                ),
              ),
            SizedBox(
              width: 150,
              // todo: fix this textfield
              child: TextField(
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'Yekanbakh', fontSize: 20),
                decoration: const InputDecoration(
                  hintText: 'مقدار را وارد کنید',
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Yekanbakh',
                      fontSize: 20),
                ),
                onChanged: (value) {},
              ),
            )
          ],
        ),
      )),
    );
  }
}

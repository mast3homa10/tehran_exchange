import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Theme.of(context).dividerTheme.color),
                  ),
                  GestureDetector(
                    child: Row(
                      textBaseline: TextBaseline.ideographic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          cryptoTitle,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: Theme.of(context).dividerTheme.color,
                                  fontSize: 18),
                        ),
                        const Icon(
                          FontAwesomeIcons.angleDown,
                        ),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  FontAwesomeIcons.unlockKeyhole,
                  color: Theme.of(context).dividerTheme.color,
                ),
              ),
            Expanded(
              child: SizedBox(
                width: 150,
                // todo: fix this textfield
                child: TextField(
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontFamily: 'Yekanbakh', fontSize: 20),
                  decoration: InputDecoration(
                      hintText: 'مقدار را وارد کنید',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(
                              color: Theme.of(context).dividerTheme.color)),
                  onChanged: (value) {},
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

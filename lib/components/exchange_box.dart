import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_search_delegate.dart';

class ExchangeBox extends StatelessWidget {
  const ExchangeBox({
    Key? key,
    this.title = '',
    this.cryptoTitle = '',
    this.isHaveIcon = false,
    this.isIconChange = 0,
    this.iconColour = Colors.white,
    this.openIconPressed,
    this.closeIconPressed,
  }) : super(key: key);
  final String title;
  final String cryptoTitle;
  final Color iconColour;
  final bool isHaveIcon;
  final int isIconChange;
  final VoidCallback? openIconPressed;
  final VoidCallback? closeIconPressed;

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              FontAwesomeIcons.bitcoin,
              color: iconColour,
              size: 30,
            ),
          ),
          TextButton(
            onPressed: () {
              // launch searchbox by tap here
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            style: ButtonStyle(
                side: MaterialStateProperty.all<BorderSide>(BorderSide(
                    width: 0,
                    color: Theme.of(context).appBarTheme.backgroundColor ??
                        Theme.of(context).scaffoldBackgroundColor))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Theme.of(context).dividerTheme.color),
                ),
                Row(
                  textBaseline: TextBaseline.ideographic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      cryptoTitle,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Theme.of(context).dividerTheme.color,
                          fontSize: 18),
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
          const VerticalDivider(
            color: Color(0xFFFFFFFF),
            indent: 9,
            endIndent: 9,
          ),
          // following part is for provide for fixer.
          buildFixer(context),
          //end of fixer

          Expanded(
            child: SizedBox(
              width: 150,
              // todo: textfield
              child: TextField(
                textAlign: TextAlign.center,
                style: const TextStyle(fontFamily: 'Yekanbakh', fontSize: 20),
                decoration: InputDecoration(
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

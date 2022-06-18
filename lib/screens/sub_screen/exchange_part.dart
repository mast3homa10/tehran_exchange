import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/custom_big_button.dart';
import '../../controllers/controller_1.dart';

class ExchangePart extends StatelessWidget {
  ExchangePart({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8.0),
          height: 90,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).dividerTheme.color ??
                  const Color(0xFFEEEEEE),
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
                    onPressed: () {
                      Get.snackbar('توجه!', "در حال توسعه ...");
                    },
                  ),
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
                        color: Colors.white,
                        fontFamily: 'Yekanbakh',
                        fontSize: 20),
                    decoration: InputDecoration(
                      hintText: 'وارد کردن آدرس',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(
                              color: Theme.of(context).dividerTheme.color),
                    ),
                    onChanged: (value) {},
                  ),
                )
              ],
            ),
          )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 18.0),
              child: GestureDetector(
                child: Text(
                  'کیف پول ندارید؟',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Theme.of(context).dividerTheme.color),
                ),
                onTap: () {
                  Get.snackbar("توجه!", "در حال توسعه ...");
                },
              ),
            ),
          ],
        ),
        SizedBox(height: Get.height / 3.53),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: CustomBigButton(
            label: 'شروع تبادل',
            onPressed: () {
              // Get.snackbar('توجه!', "در حال توسعه ...");
              controller.changeScreen();
              Network().postUser();
            },
          ),
        ),
      ],
    );
  }
}

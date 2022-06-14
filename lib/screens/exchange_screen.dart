import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../components/custom_big_button.dart';
import '../controllers/controller_1.dart';
import '../constants.dart';
import 'sub_screen/address_screen.dart';

class ExchangeScreen extends StatelessWidget {
  ExchangeScreen({Key? key}) : super(key: key);
  final TextEditingController firstTextController = TextEditingController();
  final TextEditingController secondTextController = TextEditingController();
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => controller.isChangeScreen.toInt() == 1
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CoustomIconButton(
                          label: 'اسکن کیف پول',
                          icon: const Icon(FontAwesomeIcons.qrcode),
                          press: () {},
                        ),
                        CoustomIconButton(
                          label: 'اضافه کردن کیف پول',
                          icon: const Icon(FontAwesomeIcons.wallet),
                          press: () {},
                        ),
                        CoustomIconButton(
                          label: 'دفترچه آدرس',
                          icon: const Icon(FontAwesomeIcons.book),
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    height: 90,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFEEEEEE),
                        style: BorderStyle.solid,
                        width: 2.0,
                      ),
                      color: kChangerContainerColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: TextButton(
                                child: const Text("چسباندن"),
                                onPressed: () {
                                  Get.snackbar('توجه!', "در حال توسعه ...");
                                },
                              )),
                          const SizedBox(
                            width: 20,
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
                              decoration: const InputDecoration(
                                hintText: 'وارد کردن آدرس',
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
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 18.0, left: 18.0),
                        child: Text('کیف پول ندارید؟'),
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
              )
            : AddressScreen(controller: controller),
      ),
    );
  }
}

class CoustomIconButton extends StatelessWidget {
  const CoustomIconButton(
      {Key? key, this.label = '', required this.icon, required this.press})
      : super(key: key);
  final VoidCallback press;
  final Icon icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration:
              const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          child: IconButton(
            iconSize: 30,
            disabledColor: Colors.red,
            onPressed: () {},
            icon: icon,
          ),
        ),
        Text(label)
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../frontend/components/paste_address_box.dart';
import '../../final_steps/final_steps_page.dart';
import '../../../components/custom_big_button.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Get.height * 0.37,
          child: Column(
            children: [
              const PasteAddressBox(
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
              const PasteAddressBox(
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

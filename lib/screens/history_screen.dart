import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tehran_exchange/components/custom_big_button.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 70,
            width: 70,
            child: AspectRatio(
              aspectRatio: 1 / 0.5,
              child: Image(
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
          ),
          const Center(
            child: Text(
              'هنوز هیچ تراکنیش نداشتید!',
              style: TextStyle(
                  fontFamily: 'Yekanbakh',
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Text(
              'همه تراکنش های شما در این جا ذخیره خواهند شد. \nشما می توانید اولین تبادل خود را همین حال آغاز کنید'),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomBigButton(
              label: 'شروع تبادل',
              onPressed: () {
                Get.snackbar('توجه!', "در حال توسعه ...");
              },
            ),
          ),
        ],
      ),
    );
  }
}

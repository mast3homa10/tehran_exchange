import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tehran_exchange/pages/menu/menu_page_controller.dart';

import '../../toggel_bar.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (MenuPageController controller) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Slides',
              ),
            ),
            SizedBox(
              height: Get.height * 0.12,
              child: ToggleBar(
                  w: 110,
                  labels: ['پشتیبانی', 'سرویس', 'تنظیمات'],
                  backgroundBorder: Border.all(width: 0.0),
                  onSelectionUpdated: (index) =>
                      controller.changeMeneItem(index)),
            ),
            IndexedStack(
              index: controller.menuIndex.toInt(),
              children: [
                Text('1'),
                Text('2'),
                Text('3'),
              ],
            )
          ],
        ),
      );
    });
  }
}

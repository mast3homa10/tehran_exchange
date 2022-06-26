import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';

import '../../../../constants.dart';

class TimerController extends GetxController {
  var seconds = kMaxSeconds.obs;
  var conuter = 0.obs;
  var time = ''.obs;

  Timer? timer;
  setTimer(int maxSeconds) {
    seconds = maxSeconds.obs;
    update();
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      decrement();
    });
  }

  stopTimer() {
    seconds = kMaxSeconds.obs;
    update();

    timer!.cancel();
  }

  decrement() {
    if (seconds > 0) {
      seconds--;
      update();
      time =
          '${((seconds / 60).truncate() % 60).toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, '0')}'
              .obs;
      log('$time');
    } else {
      Get.snackbar('توجه!', "زمان به پایان رسید");
      stopTimer();
    }
  }
}

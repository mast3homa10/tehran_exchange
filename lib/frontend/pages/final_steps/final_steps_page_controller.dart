import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tehran_exchange/frontend/pages/exchange/controllers/timer_controller.dart';

class FinalStepsController extends GetxController {
  var currentstep = 0.obs;
  RxBool isActive = true.obs;
  var timerController = TimerController().obs;

  @override
  void onClose() {
    timerController.value.stopTimer();
    super.onClose();
  }

  var steps = [
    const Text('test1'),
    const Text('test12'),
    const Text('test123'),
  ].obs;
  var stepslable = [
    '3',
    '2',
    '1',
  ].obs;
}

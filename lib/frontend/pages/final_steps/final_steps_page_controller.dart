import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinalStepsController extends GetxController {
  var currentstep = 0.obs;

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

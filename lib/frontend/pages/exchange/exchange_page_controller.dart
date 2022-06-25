import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:tehran_exchange/constants.dart';
import '../../../backend/models/currency_model.dart';

class TimerController extends GetxController {
  var seconds = kMaxSeconds.obs;
  var conuter = 0.obs;

  Timer? timer;

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      decrement();
    });
  }

  stopTimer() {
    timer!.cancel();
  }

  decrement() {
    if (seconds > 0) {
      seconds--;
      log('$seconds');
      update();
    } else {}
  }
}

class ExchangePageController extends GetxController {
  var isScreenChange = 0.obs;
  var currentTopItem = 0.obs;
  var isIconChange = 0.obs;
  var searchController = 0.obs;
  var qrcodeResult = ''.obs;
  var firstCurrencyChoiceEnglishName = 'Tether'.obs;
  var firstCurrencyChoiceSymbol = 'USDT'.obs;
  var firstCurrencyChoiceImageUrl = ''.obs;
  var secondCurrencyChoiceEnglishName = 'Bitcoin'.obs;
  var secondCurrencyChoiceSymbol = 'BTC'.obs;
  var secondCurrencyChoiceImageUrl = ''.obs;
  var connectToNetwork = false.obs;

  @override
  void onInit() {
    checkConnection();
    super.onInit();
  }

  checkConnection() async {
    //check connection to network
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        log('connected');
        connectToNetwork = true.obs;
        update();
      }
    } on SocketException catch (_) {
      log('not connected');
      connectToNetwork = false.obs;
      update();
    }
  }

  setQrcodeAddress(String address) {
    qrcodeResult = address.obs;
    update();
  }

  updateCurrencyChoice({required CurrencyModel model, required int item}) {
    if (item == 1) {
      secondCurrencyChoiceEnglishName = model.engName!.obs;
      secondCurrencyChoiceSymbol = model.symbol!.obs;
      secondCurrencyChoiceImageUrl = model.imageUrl!.obs;
    } else {
      firstCurrencyChoiceEnglishName = model.engName!.obs;
      firstCurrencyChoiceSymbol = model.symbol!.obs;
      firstCurrencyChoiceImageUrl = model.imageUrl!.obs;
    }

    update();
  }

  cahngeSearchController(int index) {
    searchController = index.obs;
    update();
  }

  getCurrentTopItem(int index) {
    currentTopItem = index.obs;
    update();
  }

  changeScreen() {
    isScreenChange == 0.obs ? isScreenChange + 1 : isScreenChange - 1;
    update();
  }

  changeIcon() {
    isIconChange = isIconChange == 0.obs ? 1.obs : 0.obs;
    update();
  }
}

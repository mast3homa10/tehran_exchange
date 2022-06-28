import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:tehran_exchange/backend/api/currency_list_api.dart';

import '../../../../backend/models/currency_model.dart';

class ExchangePageController extends GetxController {
  var isScreenChange = false.obs;
  var currentTopItem = 0.obs;
  var isIconChange = false.obs;
  var searchController = 0.obs;
  var qrcodeResult = ''.obs;
  var firstCurrencyChoiceEnglishName = 'Tether'.obs;
  var firstCurrencyChoiceSymbol = 'USDT'.obs;
  var firstCurrencyChoiceImageUrl = ''.obs;
  var secondCurrencyChoiceEnglishName = 'Bitcoin'.obs;
  var secondCurrencyChoiceSymbol = 'BTC'.obs;
  var secondCurrencyChoiceImageUrl = ''.obs;
  var connectToNetwork = false.obs;
  var btcDefault;
  var ethDefault;
  var forSellList;
  var forBuyList;
  List<CurrencyModel>? currencyList = [];
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
        currencyList = await CurrencyListApi().getList();
        btcDefault = currencyList!
            .where((item) => item.engName!.toLowerCase() == 'bitcoin');
        log("$btcDefault");
        ethDefault = currencyList!
            .where((item) => item.engName!.toLowerCase() == 'ethereum');
        log("$ethDefault");
        forSellList = currencyList!
            .where((item) => item.availableForSell == true)
            .toList();
        log("$forSellList");
        forBuyList = currencyList!
            .where((item) => item.availableForBuy == true)
            .toList();
        log("$forBuyList");

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
    isScreenChange = isScreenChange.value ? false.obs : true.obs;
    update();
  }

  changeIcon() {
    isIconChange = isIconChange.value ? false.obs : true.obs;
    update();
  }
}

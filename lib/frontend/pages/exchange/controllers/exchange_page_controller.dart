import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:tehran_exchange/backend/api/check_pair_be_vaild.dart';
import 'package:tehran_exchange/backend/models/init_tabel_model.dart';

import '../../../../backend/api/init-table.dart';
import '../../../../backend/models/currency_model.dart';

class ExchangePageController extends GetxController {
  var isScreenChange = false.obs;
  var currentTopItem = 0.obs;
  var isIconChange = false.obs;
  var searchController = 0.obs;
  var qrcodeResult = ''.obs;
  var connectToNetwork = false.obs;
  CurrencyModel? forSellChoice;
  double? forSellAmount;
  CurrencyModel? forBuyChoice;
  double? forBuyAmount;
  List<CurrencyModel>? forSellList;
  List<CurrencyModel>? forBuyList;
  List<CurrencyModel>? currencyList = [];
  InitTabelModel? estimate;
  var pairValid;
  @override
  void onInit() {
    checkConnection();
    super.onInit();
  }

  updateEstimateAmount(double sellAmount, double buyAmount) {
    forSellAmount = sellAmount;
    forBuyAmount = buyAmount;
    update();
  }

  bb(
      {String? sourceCurrency,
      String? destinationCurrency,
      String? type,
      String? sourceNetwork,
      String? destinationNetwork}) async {
    pairValid = await CheckPairBeVaildApi().getPairBeVaild(
        destinationCurrency: destinationCurrency,
        destinationNetwork: destinationNetwork,
        sourceCurrency: sourceCurrency,
        sourceNetwork: sourceNetwork,
        type: type);
    update();
  }

  checkConnection() async {
    //check connection to network
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        log('connected');
        connectToNetwork = true.obs;
        // get currency list
        //get init table
        var initTable = await InitTableApi().initTable();
        estimate = initTable!['estimate'] ?? [];
        forSellAmount = estimate!.sourceAmount;
        forBuyAmount = estimate!.destinationAmount;
        log('${estimate!.destinationAmount}.');

        currencyList = initTable['list'] ?? {};

        forSellChoice = currencyList!
            .where((item) => item.engName!.toLowerCase() == 'bitcoin')
            .first;
        log("$forSellChoice");
        forBuyChoice = currencyList!
            .where((item) => item.engName!.toLowerCase() == 'ethereum')
            .first;
        log("$forBuyChoice");
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

  updateCurrencyChoice({required CurrencyModel currency, required int item}) {
    if (item == 1) {
      forBuyChoice = currency;
    } else {
      forSellChoice = currency;
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

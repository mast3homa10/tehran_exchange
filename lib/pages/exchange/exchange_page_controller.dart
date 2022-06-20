import 'package:get/get.dart';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../../models/currency_model.dart';

const String _baseUrl = 'http://65.108.225.114:3001/api/v1/Decentralized/';
const String currencyListEndpoint = 'currencies-list';

class ExchangePageController extends GetxController {
  var isChangeScreen = 0.obs;
  var currentTopItem = 0.obs;
  var isIconChange = 0.obs;

  getCurrentTopItem(int index) {
    currentTopItem = index.obs;
    update();
  }

  changeScreen() {
    isChangeScreen == 0.obs ? isChangeScreen + 1 : isChangeScreen - 1;
    update();
  }

  changeIcon() {
    isIconChange = isIconChange == 0.obs ? 1.obs : 0.obs;
    update();
  }
}

class WelcomePageController extends GetConnect implements GetxService {
  // Post request'http://65.108.225.114:3001/api/v1/Decentralized/currencies-list'

}

class Network {
  postUser() async {
    http.Response response = await http.post(
        Uri.parse(_baseUrl + currencyListEndpoint),
        body: json.encode({"active": true, "type": "not-fix"}),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> data = map['data']['currencies'];

      List<CurrencyModel> list = [];
      for (var item in data) {
        try {
          if (item != null) {
            list.add(CurrencyModel.fromJson(item));
          }
        } catch (e) {
          log("$e");
        }

        log("///////////////////////////////////////");
      }
      log("$list");
    } else {
      log("${response.statusCode}");
    }
  }
}

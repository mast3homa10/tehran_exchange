import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/currency_model.dart';

const String _baseUrl = 'http://65.108.225.114:3001/api/v1/Decentralized/';
const String currencyListEndpoint = 'currencies-list';

class Controller extends GetConnect implements GetxService {
  var isChangeScreen = 0.obs;

  changeScreen() =>
      isChangeScreen == 0.obs ? isChangeScreen + 1 : isChangeScreen - 1;
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
          print(e);
        }

        print("///////////////////////////////////////");
      }
      print(list);
    } else {
      print(response.statusCode);
    }
  }
}

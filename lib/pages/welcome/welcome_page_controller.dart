import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/currency_model.dart';

const String _baseUrl = 'http://65.108.225.114:3001/api/v1/Decentralized/';
const String currencyListEndpoint = 'currencies-list';

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

  dioPostUser() async {
    var dio = Dio();

    final response = await dio.post(_baseUrl + currencyListEndpoint,
        data: {'id': 12, 'name': 'wendu'});
    log('$response');
  }
}
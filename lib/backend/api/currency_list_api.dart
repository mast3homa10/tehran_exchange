import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../../backend/models/currency_model.dart';

const String _baseUrl = 'http://65.108.225.114:3001/api/v1/Decentralized/';
const String currencyListEndpoint = 'currencies-list';

class CurrencyListApi {
  Future<List<CurrencyModel>?> getList() async {
    List<CurrencyModel> list = [];
    try {
      http.Response response =
          await http.post(Uri.parse(_baseUrl + currencyListEndpoint),
              body: json.encode({
                "active": true,
              }),
              headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['data']['currencies'];
        data.removeWhere((element) => element == null);

        list = data.map((item) => CurrencyModel.fromJson(item)).toList();
        return list;
      } else {
        log("${response.statusCode}");
      }
    } catch (e) {
      log('$e');
    }
  }
}

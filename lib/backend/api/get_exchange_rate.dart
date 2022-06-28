import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../backend/models/get_exchange_rate_model.dart';
import '../../backend/models/currency_model.dart';
import '../network_constants.dart';

class GetExchangeRateApi {
  Future<List<CurrencyModel>> getExchangeRate() async {
    List<CurrencyModel> list = [];
    http.Response response = await http.post(
        Uri.parse(baseUrl + getExchangeRateEndpoint),
        body: json.encode({
          "sourceCurrency": "btc",
          "destinationCurrency": "eth",
          "type": "not-fix",
          "sourceNetwork": "btc",
          "destinationNetwork": "eth"
        }),
        headers: {
          'x-changenow-api-key': '{{free-api-key}}',
          'Content-Type': 'application/json'
        });

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          json.decode(response.body)['data']['exchangeRate'];

      var decodedData = GetExchangeRateModel.fromJson(data);
      log('$decodedData');
      return list;
    } else {
      log("${response.statusCode}");
      return list;
    }
  }
}

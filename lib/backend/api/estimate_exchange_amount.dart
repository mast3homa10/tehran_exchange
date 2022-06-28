import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../../backend/models/estimate_exchange_amount_model.dart';
import '../../backend/models/currency_model.dart';
import '../network_constants.dart';

class EstimateExchangeAmountApi {
  Future<List<CurrencyModel>> getAmount() async {
    List<CurrencyModel> list = [];
    http.Response response =
        await http.post(Uri.parse(baseUrl + esimatExchangeAmountEndpoint),
            body: json.encode({
              "sourceCurrency": "btc",
              "destinationCurrency": "usdt",
              "type": "fix",
              "directionOfExchangeFlow": "direct",
              "sourceAmount": 0.1,
              "sourceNetwork": "btc",
              "destinationNetwork": "eth"
            }),
            headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          json.decode(response.body)['data']['estimateExchangeAmount'];

      var decodedData = EstimateExchangeAmountModel().fromJson(data);
      log('$decodedData');
      return list;
    } else {
      log("${response.statusCode}");
      return list;
    }
  }
}

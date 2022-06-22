import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../../backend/models/currency_model.dart';

const String _baseUrl = 'http://65.108.225.114:3001/api/v1/Decentralized/';
const String getExchangeRateEndpoint = 'get-exchange-rate';

class GetExchangeRateApi {
  Future<List<CurrencyModel>> getExchangeRate() async {
    List<CurrencyModel> list = [];
    http.Response response = await http.post(
        Uri.parse(_baseUrl + getExchangeRateEndpoint),
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

class GetExchangeRateModel {
  String? sourceCurrency;
  String? sourceNetwork;
  String? destinationCurrency;
  String? destinationNetwork;
  String? type;
  String? maximumExchangeAmount;
  double? minimumExchangeAmount;

  GetExchangeRateModel({
    this.maximumExchangeAmount = '',
    this.minimumExchangeAmount = 0.0002839,
    this.destinationCurrency = 'test',
    this.destinationNetwork = 'test',
    this.sourceCurrency = 'test',
    this.sourceNetwork = 'test',
    this.type = 'test',
  });

  GetExchangeRateModel.fromJson(json) {
    destinationCurrency = json['destinationCurrency'];
    destinationNetwork = json['destinationNetwork'];
    sourceCurrency = json['sourceCurrency'];
    sourceNetwork = json['sourceNetwork'];
    type = json['type'];
    maximumExchangeAmount = json['maximumExchangeAmount'];
    minimumExchangeAmount = json['minimumExchangeAmount'];
  }

  @override
  toString() =>
      "{minimumExchangeAmount: $minimumExchangeAmount}, {type: $type ...},";
}

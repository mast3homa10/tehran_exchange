import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../../backend/models/currency_model.dart';

const String _baseUrl = 'http://65.108.225.114:3001/api/v1/Decentralized/';
const String esimatExchangeAmountEndpoint = 'estimate-exchange-amount';

class EstimateExchangeAmountApi {
  Future<List<CurrencyModel>> getEstimateExchangeAmount() async {
    List<CurrencyModel> list = [];
    http.Response response =
        await http.post(Uri.parse(_baseUrl + esimatExchangeAmountEndpoint),
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

      var a = EstimateExchangeAmountModel().fromJson(data);
      log('${a}');
      return list;
    } else {
      log("${response.statusCode}");
      return list;
    }
  }
}
// var headers = {
//   'Content-Type': 'application/json'
// };
// var request = http.Request('POST', Uri.parse('65.108.225.114:3001/api/v1/Decentralized/estimate-exchange-amount'));
// request.body = json.encode({
//   "sourceCurrency": "btc",
//   "destinationCurrency": "usdt",
//   "type": "fix",
//   "directionOfExchangeFlow": "direct",
//   "sourceAmount": 0.1,
//   "sourceNetwork": "btc",
//   "destinationNetwork": "eth"
// });
// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }

class EstimateExchangeAmountModel {
  String? sourceCurrency;
  String? sourceNetwork;
  String? destinationCurrency;
  String? destinationNetwork;
  String? type;
  String? directionOfExchangeFlow;
  String? rateId;
  String? minAndMaxEstimatedTime;
  String? message;
  double? sourceAmount;
  double? destinationAmount;
  String? validUntil;

  EstimateExchangeAmountModel({
    this.destinationAmount = 2087.933444,
    this.destinationCurrency = 'test',
    this.destinationNetwork = 'test',
    this.directionOfExchangeFlow = 'test',
    this.message = 'test',
    this.minAndMaxEstimatedTime = 'test',
    this.rateId = 'test',
    this.sourceAmount = 0.1,
    this.sourceCurrency = 'test',
    this.sourceNetwork = 'test',
    this.type = 'test',
    this.validUntil = 'test',
  });

  EstimateExchangeAmountModel fromJson(json) => EstimateExchangeAmountModel(
        destinationAmount: json['destinationAmount'],
        destinationCurrency: json['destinationCurrency'],
        destinationNetwork: json['destinationNetwork'],
        directionOfExchangeFlow: json['directionOfExchangeFlow'],
        rateId: json['rateId'],
        sourceAmount: json['sourceAmount'],
        sourceCurrency: json['sourceCurrency'],
        sourceNetwork: json['sourceNetwork'],
        type: json['type'],
        message: json['message'],
        minAndMaxEstimatedTime: json['minAndMaxEstimatedTime'],
        validUntil: json['validUntil'],
      );

  @override
  toString() =>
      "{rateId: $rateId}, {destinationAmount: $destinationAmount}, {destinationCurrency: $destinationCurrency ...}";
}

// var headers = {
//   'Content-Type': 'application/json'
// };
// var request = http.Request('POST', Uri.parse('65.108.225.114:3001/api/v1/Decentralized/estimate-exchange-amount'));
// request.body = json.encode({
//   "sourceCurrency": "btc",
//   "destinationCurrency": "usdt",
//   "type": "fix",
//   "directionOfExchangeFlow": "direct",
//   "sourceAmount": 0.1,
//   "sourceNetwork": "btc",
//   "destinationNetwork": "eth"
// });
// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }

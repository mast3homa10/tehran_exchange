import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../../backend/models/currency_model.dart';

const String _baseUrl = 'http://65.108.225.114:3001/api/v1/Decentralized/';
const String createTransactionEndpoint = 'create-transaction';

class CreateTransactionApi {
  Future<List<CurrencyModel>> create() async {
    List<CurrencyModel> list = [];
    http.Response response =
        await http.post(Uri.parse(_baseUrl + createTransactionEndpoint),
            body: json.encode({
              "sourceCurrency": "btc",
              "sourceNetwork": "btc",
              "destinationCurrency": "usdt",
              "destinationNetwork": "eth",
              "sourceAmount": "0.1",
              "payoutAddress": "0xD1220A0cf47c7B9Be7A2E6BA89F429762e7b9aDb",
              "type": "not-fix",
              "directionOfExchangeFlow": "direct"
            }),
            headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          json.decode(response.body)['data']['createExchangeResult'];

      var a = CreateTransactionModel().fromJson(data);
      log('${a}');
      return list;
    } else {
      log("${response.statusCode}");
      return list;
    }
  }
}

class CreateTransactionModel {
  String? id;
  String? sourceCurrency;
  String? sourceNetwork;
  String? destinationCurrency;
  String? destinationNetwork;

  String? payoutAddress;
  String? type;
  String? directionOfExchangeFlow;
  String? rateId;

  String? refundExtraId;
  String? refundAddress;
  String? payinAddress;
  String? payinExtraId;
  String? payoutExtraId;
  String? payoutExtraIdName;
  double? sourceAmount;
  double? destinationAmount;
  CreateTransactionModel(
      {this.id = 'test',
      this.sourceAmount = 0.1,
      this.destinationAmount = 2100.903587,
      this.destinationCurrency = 'test',
      this.destinationNetwork = 'test',
      this.directionOfExchangeFlow = 'test',
      this.payinAddress = 'test',
      this.payinExtraId = 'test',
      this.payoutAddress = 'test',
      this.payoutExtraId = 'test',
      this.payoutExtraIdName = 'test',
      this.rateId = 'test',
      this.refundAddress = 'test',
      this.refundExtraId = 'test',
      this.sourceCurrency = 'test',
      this.sourceNetwork = 'test',
      this.type});

  CreateTransactionModel fromJson(json) => CreateTransactionModel(
      id: json['id'],
      destinationAmount: json['destinationAmount'],
      destinationCurrency: json['destinationCurrency'],
      destinationNetwork: json['destinationNetwork'],
      directionOfExchangeFlow: json['directionOfExchangeFlow'],
      payinAddress: json['payinAddress'],
      payinExtraId: json['payinExtraId'],
      payoutAddress: json['payoutAddress'],
      payoutExtraId: json['payoutExtraId'],
      payoutExtraIdName: json['payoutExtraIdName'],
      rateId: json['rateId'],
      refundAddress: json['refundAddress'],
      refundExtraId: json['refundExtraId'],
      sourceAmount: json['sourceAmount'],
      sourceCurrency: json['sourceCurrency'],
      sourceNetwork: json['sourceNetwork'],
      type: json['type']);

  @override
  toString() =>
      "{id: $id}, {destinationAmount: $destinationAmount}, {destinationCurrency: $destinationCurrency ...}";
}

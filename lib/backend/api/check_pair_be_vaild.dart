import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../backend/models/currency_model.dart';

const String _baseUrl = 'http://65.108.225.114:3001/api/v1/Decentralized/';
const String pairBeValidEndpoint = 'check-pair-be-valid';

class CheckPairBeVaildApi {
  Future<List<CurrencyModel>> getPairBeVaild() async {
    List<CurrencyModel> list = [];
    http.Response response = await http.post(
        Uri.parse(_baseUrl + pairBeValidEndpoint),
        body: json.encode({
          "sourceCurrency": "btc",
          "destinationCurrency": "usdt",
          "type": "fix",
          "sourceNetwork": "btc",
          "destinationNetwork": "eth"
        }),
        headers: {
          'x-changenow-api-key': '{{free-api-key}}',
          'Content-Type': 'application/json'
        });

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      log('${data["data"]["checkPair"]}');
      data["data"]["checkPair"].removeWhere((element) => element == null);

      var decodedData = CheckPairBeVaildModel.fromJson(data);
      log('$decodedData');
      return list;
    } else {
      log("${response.statusCode}");
      return list;
    }
  }
}

class CheckPairBeVaildModel {
  String? sourceCurrency;
  String? sourceNetwork;
  String? destinationCurrency;
  String? destinationNetwork;
  List<TypeModel>? type;
  CheckPairBeVaildModel(
      {this.sourceCurrency = 'test',
      this.sourceNetwork = 'test',
      this.destinationCurrency = 'test',
      this.destinationNetwork = 'test',
      this.type});

  CheckPairBeVaildModel.fromJson(Map<String, dynamic> json) {
    sourceCurrency = json["sourceCurrency"];
    sourceNetwork = json["sourceNetwork"];
    destinationCurrency = json["destinationCurrency"];
    destinationNetwork = json["destinationNetwork"];
    if (json["type"] != null) {
      type = (json["type"] as List)
          .map((item) => TypeModel().fromJson(item))
          .toList();
    }
  }
  @override
  toString() =>
      "{sourceCurrency: $sourceCurrency}, {destinationCurrency: $destinationCurrency}, {type: $type}";
}

class TypeModel {
  bool? fix;
  bool? notFix;
  TypeModel({this.fix, this.notFix});

  TypeModel fromJson(json) =>
      TypeModel(fix: json["fix"], notFix: json["not-fix"]);
}

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../backend/models/validation_address_model.dart';
import '../../backend/models/currency_model.dart';
import '../network_constants.dart';

class ValidationAddressApi {
  Future<List<CurrencyModel>> getValidation() async {
    List<CurrencyModel> list = [];
    http.Response response = await http.post(
        Uri.parse(baseUrl + validationAddressEndpoint),
        body: json.encode({
          "currency": "btc",
          "address": "12QeMLzSrB8XH8FvEzPMVoRxVAzTr5XM2y"
        }),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          json.decode(response.body)['data']['validAddress'];

      var decodedData = ValidationAddressModel.fromJson(data);
      log('$decodedData');
      return list;
    } else {
      log("${response.statusCode}");
      return list;
    }
  }
}

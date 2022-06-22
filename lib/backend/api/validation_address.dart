import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../../backend/models/currency_model.dart';

const String _baseUrl = 'http://65.108.225.114:3001/api/v1/Decentralized/';
const String validationAddressEndpoint = 'validation-address';

class ValidationAddressApi {
  Future<List<CurrencyModel>> getValidation() async {
    List<CurrencyModel> list = [];
    http.Response response = await http.post(
        Uri.parse(_baseUrl + validationAddressEndpoint),
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

class ValidationAddressModel {
  bool? isValid;
  String? message;

  ValidationAddressModel({
    this.isValid = false,
    this.message = 'test',
  });

  ValidationAddressModel.fromJson(json) {
    isValid = json['isValid'];
    message = json['message'];
  }

  @override
  toString() => " {isValid: $isValid }{message: $message ...},,";
}


// var headers = {
//   'Content-Type': 'application/json'
// };
// var request = http.Request('POST', Uri.parse('65.108.225.114:3001/api/v1/Decentralized/validation-address'));
// request.body = json.encode({
//   "currency": "btc",
//   "address": "12QeMLzSrB8XH8FvEzPMVoRxVAzTr5XM2y"
// });
// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }validAddress

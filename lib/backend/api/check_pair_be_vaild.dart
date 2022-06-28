import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../backend/models/check_pair_be_vaild_model.dart';
import '../network_constants.dart';

class CheckPairBeVaildApi {
  Future<CheckPairBeVaildModel?> getPairBeVaild(
      {String? sourceCurrency,
      String? destinationCurrency,
      String? type,
      String? sourceNetwork,
      String? destinationNetwork}) async {
    http.Response response = await http.post(
        Uri.parse(baseUrl + pairBeValidEndpoint),
        body: json.encode({
          "sourceCurrency": sourceCurrency,
          "destinationCurrency": destinationCurrency,
          "type": type,
          "sourceNetwork": "sourceNetwork",
          "destinationNetwork": "destinationNetwork"
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
      return decodedData;
    } else {
      log("${response.statusCode}");
    }
  }
}

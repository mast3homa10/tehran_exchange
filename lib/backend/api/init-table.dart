import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../backend/models/init_tabel_model.dart';
import '../../backend/models/currency_model.dart';
import '../network_constants.dart';

class InitTableApi {
  Future<InitTabelModel?> initTable() async {
    http.Response response =
        await http.get(Uri.parse(baseUrl + initTabelEndpoint));

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          json.decode(response.body)['data']['estimateBTCETH'];

      InitTabelModel decodedData = InitTabelModel.fromJson(data);
      log('$decodedData');
      return decodedData;
    } else {
      log("${response.statusCode}");
    }
  }

  Future<List<CurrencyModel>?> getList() async {
    List<CurrencyModel> list = [];
    try {
      http.Response response =
          await http.get(Uri.parse(baseUrl + initTabelEndpoint));

      if (response.statusCode == 200) {
        List<dynamic> data =
            json.decode(response.body)['data']["list"]['currencies'];
        data.removeWhere((element) => element == null);

        list = data.map((item) => CurrencyModel.fromJson(item)).toList();
        log("$list");

        return list;
      } else {
        log("${response.statusCode}");
      }
    } catch (e) {
      log('$e');
    }
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../../backend/models/currency_model.dart';

const String _baseUrl = 'http://65.108.225.114:3001/api/v1/Decentralized/';
const String getExchangeRateEndpoint = 'get-transaction-status';

class GetTransactionStatusApi {
  Future<List<CurrencyModel>> getExchangeRate() async {
    List<CurrencyModel> list = [];
    http.Response response = await http.post(
        Uri.parse(_baseUrl + getExchangeRateEndpoint),
        body: json.encode({"transactionId": "3ab2aa7958f515"}),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          json.decode(response.body)['data']['transactionStatus'];

      var decodedData = GetTransactionStatusModel.fromJson(data);
      log('$decodedData');
      return list;
    } else {
      log("${response.statusCode}");
      return list;
    }
  }
}

class GetTransactionStatusModel {
  String? txId;
  String? txStatus;
  String? actionsAvailable;
  String? sourceCurrency;
  String? sourceCurrencyImage;
  String? sourceCurrencyFaName;
  String? sourceNetwork;
  String? destinationCurrency;
  String? destinationCurrencyImage;
  String? destinationCurrencyFaName;
  String? destinationNetwork;
  double? expectedAmountFromSource;
  double? expectedAmountToDestination;
  String? amountFromSource;
  String? amountToDestination;
  String? payinAddress;
  String? payoutAddress;
  String? payinExtraId;
  String? payoutExtraId;
  String? refundAddress;
  String? refundExtraId;
  String? createdAt;
  String? updatedAt;
  String? depositReceivedDate;
  String? payinHash;
  String? payoutHash;
  String? fromLegacyTicker;
  String? toLegacyTicker;

  GetTransactionStatusModel(
      {this.actionsAvailable,
      this.amountFromSource,
      this.amountToDestination,
      this.createdAt,
      this.depositReceivedDate,
      this.destinationCurrency,
      this.destinationCurrencyFaName,
      this.destinationCurrencyImage,
      this.destinationNetwork,
      this.expectedAmountFromSource,
      this.expectedAmountToDestination,
      this.fromLegacyTicker,
      this.payinAddress,
      this.payinExtraId,
      this.payinHash,
      this.payoutAddress,
      this.payoutExtraId,
      this.payoutHash,
      this.refundAddress,
      this.refundExtraId,
      this.sourceCurrency,
      this.sourceCurrencyFaName,
      this.sourceCurrencyImage,
      this.sourceNetwork,
      this.toLegacyTicker,
      this.txId,
      this.txStatus,
      this.updatedAt});

  GetTransactionStatusModel.fromJson(json) {
    actionsAvailable = json['actionsAvailable'];
    amountFromSource = json['amountFromSource'];
    amountToDestination = json['amountToDestination'];
    createdAt = json['createdAt'];
    depositReceivedDate = json['depositReceivedDate'];
    destinationCurrency = json['destinationCurrency'];
    destinationCurrencyFaName = json['destinationCurrencyFaName'];
    destinationCurrencyImage = json['destinationCurrencyImage'];
    destinationNetwork = json['destinationNetwork'];
    expectedAmountFromSource = json['expectedAmountFromSource'];
    expectedAmountToDestination = json['expectedAmountToDestination'];
    fromLegacyTicker = json['fromLegacyTicker'];
    payinAddress = json['payinAddress'];
    payinExtraId = json['payinExtraId'];
    payinHash = json['payinHash'];
    payoutAddress = json['payoutAddress'];
    payoutExtraId = json['payoutExtraId'];
    payoutHash = json['payoutHash'];
    refundAddress = json['refundAddress'];
    refundExtraId = json['refundExtraId'];
    sourceCurrency = json['sourceCurrency'];
    sourceCurrencyFaName = json['sourceCurrencyFaName'];
    sourceCurrencyImage = json['sourceCurrencyImage'];
    sourceNetwork = json['sourceNetwork'];
    toLegacyTicker = json['toLegacyTicker'];
    txId = json['txId'];
    txStatus = json['txStatus'];
    updatedAt = json['updatedAt'];
  }

  @override
  toString() => "{txId: $txId}, {txStatus: $txStatus ...},";
}




// var headers = {
//   'Content-Type': 'application/json'
// };
// var request = http.Request('POST', Uri.parse('65.108.225.114:3001/api/v1/Decentralized/get-transaction-status'));
// request.body = json.encode({
//   "transactionId": "3ab2aa7958f515"
// });
// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }transactionStatus

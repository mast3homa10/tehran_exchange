import 'type_model.dart';

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
      "\n {sourceCurrency: $sourceCurrency}, {destinationCurrency: $destinationCurrency}, {type: $type}";
}

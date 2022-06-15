import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CurrencyModel {
  String? name;
  double? price;
  String? label;
  Widget? icon;
  String? symbol;
  String? engName;
  String? faName;
  String? imageUrl;
  bool? hasExternalId;
  bool? isFiatCurrency;
  bool? isFeatured;
  bool? isStableCoin;
  bool? supportsFixedRate;
  String? inNetwork;
  bool? availableForBuy;
  bool? availableForSell;
  String? legacyTicker;
  bool? isActive;

  CurrencyModel(
      {this.name,
      this.price,
      this.label,
      this.icon,
      this.symbol,
      this.engName,
      this.faName,
      this.imageUrl,
      this.hasExternalId,
      this.isFiatCurrency,
      this.isFeatured,
      this.isStableCoin,
      this.supportsFixedRate,
      this.inNetwork,
      this.availableForBuy,
      this.availableForSell,
      this.legacyTicker,
      this.isActive});
  CurrencyModel.fromJson(Map<String, dynamic> json)
      : symbol = json['symbol'],
        engName = json['engName'],
        faName = json['faName'],
        imageUrl = json['imageUrl'].toList();

  @override
  toString() => "{symbol: $symbol}, {engName: $engName}, {faName: $faName}";
}

List<CurrencyModel> dataList = [
  CurrencyModel(
    name: 'Bitcoin',
    label: "BTC",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'Tether',
    label: "USDT",
    price: 1.2,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'Uni corn',
    label: "UNI",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'kardano',
    label: "DOT",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'Bitcoin',
    label: "BTC",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'Tether',
    label: "USDT",
    price: 1.2,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'Uni corn',
    label: "UNI",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'kardano',
    label: "DOT",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'Bitcoin',
    label: "BTC",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'Tether',
    label: "USDT",
    price: 1.2,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'Uni corn',
    label: "UNI",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'kardano',
    label: "DOT",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'Bitcoin',
    label: "BTC",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'Tether',
    label: "USDT",
    price: 1.2,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'Uni corn',
    label: "UNI",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'kardano',
    label: "DOT",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'Bitcoin',
    label: "BTC",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'Tether',
    label: "USDT",
    price: 1.2,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'Uni corn',
    label: "UNI",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'kardano',
    label: "DOT",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'Bitcoin',
    label: "BTC",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'Tether',
    label: "USDT",
    price: 1.2,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'Uni corn',
    label: "UNI",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'kardano',
    label: "DOT",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'Bitcoin',
    label: "BTC",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'Tether',
    label: "USDT",
    price: 1.2,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'Uni corn',
    label: "UNI",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'kardano',
    label: "DOT",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'Bitcoin',
    label: "BTC",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'Tether',
    label: "USDT",
    price: 1.2,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'Uni corn',
    label: "UNI",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
  CurrencyModel(
    name: 'kardano',
    label: "DOT",
    price: 29000000,
    icon: const Icon(
      FontAwesomeIcons.bitcoin,
      color: Colors.orange,
    ),
  ),
];

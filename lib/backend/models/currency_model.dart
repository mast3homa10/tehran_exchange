class CurrencyModel {
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
      {this.symbol = 'test',
      this.engName = 'test',
      this.faName = 'test',
      this.imageUrl = 'test',
      this.hasExternalId = false,
      this.isFiatCurrency = false,
      this.isFeatured = false,
      this.isStableCoin = false,
      this.supportsFixedRate = false,
      this.inNetwork = 'test',
      this.availableForBuy = false,
      this.availableForSell = false,
      this.legacyTicker = 'test',
      this.isActive = false});

  CurrencyModel fromJson(json) => CurrencyModel(
      symbol: json['symbol'],
      engName: json['engName'],
      faName: json['faName'],
      imageUrl: json['imageUrl'],
      hasExternalId: json['hasExternalId'],
      isFiatCurrency: json['isFiatCurrency'],
      isFeatured: json['isFeatured'],
      isStableCoin: json['isStableCoin'],
      supportsFixedRate: json['supportsFixedRate'],
      inNetwork: json['inNetwork'],
      availableForBuy: json['availableForBuy'],
      availableForSell: json['availableForSell'],
      legacyTicker: json['legacyTicker'],
      isActive: json['isActive']);

  @override
  toString() => "{symbol: $symbol}, {engName: $engName}, {faName: $faName}";
}

List<CurrencyModel> dataList = [
  CurrencyModel(
    engName: 'Bitcoin',
    symbol: "BTC",
  ),
  CurrencyModel(
    engName: 'Tether',
    symbol: "USDT",
  ),
  CurrencyModel(
    engName: 'Uni corn',
    symbol: "UNI",
  ),
  CurrencyModel(
    engName: 'Bitcoin',
    symbol: "BTC",
  ),
  CurrencyModel(
    engName: 'Tether',
    symbol: "USDT",
  ),
  CurrencyModel(
    engName: 'Uni corn',
    symbol: "UNI",
  ),
  CurrencyModel(
    engName: 'Bitcoin',
    symbol: "BTC",
  ),
  CurrencyModel(
    engName: 'Tether',
    symbol: "USDT",
  ),
  CurrencyModel(
    engName: 'Uni corn',
    symbol: "UNI",
  ),
];

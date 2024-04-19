class CoinModel {
  String? id;
  String? symbol;
  String? name;
  int? marketCapRank;
  String? dateAdded;
  double? price;
  double? marketCap;
  double? volume24h;
  double? volumeChange24h;
  String? lastUpdated;

  CoinModel({
    this.id,
    this.symbol,
    this.name,
    this.marketCapRank,
    this.dateAdded,
    this.price,
    this.marketCap,
    this.volume24h,
    this.volumeChange24h,
    this.lastUpdated,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      marketCapRank: json['market_cap_rank'],
      dateAdded: json['date_added'],
      price: json['price'],
      marketCap: json['market_cap'],
      volume24h: json['volume_24h'],
      volumeChange24h: json['volume_change_24h'],
      lastUpdated: json['last_updated'],
    );
  }
}

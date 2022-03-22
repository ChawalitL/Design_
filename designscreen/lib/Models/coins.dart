class Coins {
  String name;
  String symbol;
  String imageUrl;
  num price;
  num change;
  num changePercen;

  Coins({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercen,
  });

  factory Coins.fromJson(Map<String, dynamic> json) {
    return Coins(
        name: json['name'],
        symbol: json['symbol'],
        imageUrl: json['image'],
        price: json['current_price'],
        change: json['price_change_24h'],
        changePercen: json['price_change_percentage_24h']);
  }
}

List<Coins> coinlist = [];

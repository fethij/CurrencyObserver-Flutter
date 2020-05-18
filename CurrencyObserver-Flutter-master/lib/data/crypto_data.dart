import 'dart:async';

class Crypto {
  String name;
  String symbol;
  String price_usd;
  double percent_change_1h;
  double percent_change_24h;
  double percent_change_7d;

  Crypto({this.name, this.symbol, this.price_usd, this.percent_change_1h, this.percent_change_24h, this.percent_change_7d});

  Crypto.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        symbol = map['symbol'],
        price_usd = map['price_usd'],
        percent_change_1h = double.parse(map['percent_change_1h']),
        percent_change_24h = double.parse(map['percent_change_24h']),
        percent_change_7d = double.parse(map['percent_change_7d']);

  String getImageUrl() {
    return "https://raw.githubusercontent.com/cjdowner/cryptocurrency-icons/master/128/color/${symbol.toLowerCase()}.png";
  }
}

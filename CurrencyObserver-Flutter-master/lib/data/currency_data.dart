import 'dart:async';
import 'dart:convert';
import 'package:currencyobserverflutter/data/rest_api.dart';
import 'package:http/http.dart' as http;

class ProdCurrencyApi implements RestApiCurrency {
  String currencyUrl = "https://api.fixer.io/latest";

  @override
  Future<List<CurrencyData>> fetchCurrencies() async {
    http.Response response = await http.get(currencyUrl);

    print("Got response : ");

    final Map decoded = JSON.decode(response.body);
    final Map<String, dynamic> rates = decoded['rates'];
    final statusCode = response.statusCode;

    print(rates);

    if (statusCode != 200 || rates == null) {
      throw new FetchDataException(
          "An error ocurred : [Status Code : $statusCode]");
    }

    return rates.entries.map((e) => new CurrencyData(e.key, e.value)).toList();
  }
}


class CurrencyData {
  String name;
  double price;

  CurrencyData(String name, double price) {
    this.name = name;
    this.price = price;
  }

  String getText() {
    return "1 EUR = $price $name";
  }

  String getImageUrl() {
    return "https://raw.githubusercontent.com/transferwise/currency-flags/master/src/flags/${name.toLowerCase()}.png";
  }
}

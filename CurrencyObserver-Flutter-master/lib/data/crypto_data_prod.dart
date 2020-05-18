import 'dart:async';
import 'dart:convert';
import 'package:currencyobserverflutter/data/rest_api.dart';
import 'package:http/http.dart' as http;
import 'package:currencyobserverflutter/data/crypto_data.dart';

class ProdCryptoApi implements RestApiCrypto {
  String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";

  @override
  Future<List<Crypto>> fetchCryptoCurrencies() async {
    http.Response response = await http.get(cryptoUrl);

    final List responseBody = json.decode(response.body);
    final statusCode = response.statusCode;

    print("Got response from Crypto: ");

    if (statusCode != 200 || responseBody == null) {
      throw new FetchDataException(
          "An error ocurred : [Status Code : $statusCode]");
    }

    return responseBody.map((c) => new Crypto.fromMap(c)).toList();
  }
}

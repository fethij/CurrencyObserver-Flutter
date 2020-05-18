import 'dart:async';

import 'package:currencyobserverflutter/data/rest_api.dart';
import 'package:currencyobserverflutter/data/crypto_data.dart';

class MockCryptoRepository implements RestApiCrypto {
  @override
  Future<List<Crypto>> fetchCryptoCurrencies() {
    return new Future.value(currencies);
  }
}

var currencies = <Crypto>[
  new Crypto(
      name: "Bitcoin",
      price_usd: "800.60",
      percent_change_1h: -0.7,
      percent_change_24h: 0.4,
      percent_change_7d: 1.1),
  new Crypto(
      name: "Ethereum",
      price_usd: "650.60",
      percent_change_1h: 1.1,
      percent_change_24h: 1.4,
      percent_change_7d: 2.0),
  new Crypto(
      name: "Ripple",
      price_usd: "315.10",
      percent_change_1h: -1.7,
      percent_change_24h: 0.8,
      percent_change_7d: 1.5),
];

import 'dart:async';

import 'package:currencyobserverflutter/data/crypto_data.dart';
import 'package:currencyobserverflutter/data/currency_data.dart';


abstract class RestApiCrypto {
  Future<List<Crypto>> fetchCryptoCurrencies();
}

abstract class RestApiCurrency {
  Future<List<CurrencyData>> fetchCurrencies();
}


class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}

import 'package:currencyobserverflutter/data/currency_data.dart';
import 'package:currencyobserverflutter/data/rest_api.dart';
import 'package:currencyobserverflutter/data/crypto_data_mock.dart';
import 'package:currencyobserverflutter/data/crypto_data_prod.dart';

enum Flavor { MOCK, PROD }

//DI
class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  RestApiCrypto get cryptoApi {
    switch (_flavor) {
      case Flavor.MOCK:
        return new MockCryptoRepository();
      default:
        return new ProdCryptoApi();
    }
  }

  RestApiCurrency get currencyApi {
    switch (_flavor) {
      case Flavor.MOCK:
        return new ProdCurrencyApi();
      default:
        return new ProdCurrencyApi();
    }
  }

}

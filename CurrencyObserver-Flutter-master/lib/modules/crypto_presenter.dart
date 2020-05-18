import 'package:currencyobserverflutter/data/crypto_data.dart';
import 'package:currencyobserverflutter/data/rest_api.dart';
import 'package:currencyobserverflutter/dependency_injection.dart';

abstract class CryptoListViewContract {
  void onLoadCryptoComplete(List<Crypto> items);
  void onLoadCryptoError();
}

class CryptoListPresenter {
  CryptoListViewContract _view;
  RestApiCrypto _api;

  CryptoListPresenter(this._view) {
    _api = new Injector().cryptoApi;
  }

  void loadCurrencies() {
    _api
        .fetchCryptoCurrencies()
        .then((c) => _view.onLoadCryptoComplete(c))
        .catchError((onError) => _view.onLoadCryptoError());
  }
}

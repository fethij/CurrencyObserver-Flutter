import 'package:currencyobserverflutter/data/currency_data.dart';
import 'package:currencyobserverflutter/data/rest_api.dart';
import 'package:currencyobserverflutter/dependency_injection.dart';

abstract class CurrencyListViewContract {
  void onLoadCurrencyComplete(List<CurrencyData> items);

  void onLoadCurrencyError();
}

class CurrencyListPresenter {
  CurrencyListViewContract _view;
  RestApiCurrency _api;

  CurrencyListPresenter(this._view) {
    _api = new Injector().currencyApi;
  }

  void loadCurrencies() {
    _api
        .fetchCurrencies()
        .then((c) => _view.onLoadCurrencyComplete(c))
        .catchError((onError) => _view.onLoadCurrencyError());
  }
}

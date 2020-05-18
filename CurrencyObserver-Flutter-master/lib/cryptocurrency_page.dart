import 'package:cached_network_image/cached_network_image.dart';
import 'package:currencyobserverflutter/data/crypto_data.dart';
import 'package:currencyobserverflutter/modules/crypto_presenter.dart';
import 'package:currencyobserverflutter/platform/platform_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CryptocurrencyPage extends StatefulWidget {
  @override
  _CryptocurrencyPageState createState() => new _CryptocurrencyPageState();
}

class _CryptocurrencyPageState extends State<CryptocurrencyPage>
    implements CryptoListViewContract {
  CryptoListPresenter _presenter;
  List<Crypto> _currencies;
  bool _isLoading;

  _CryptocurrencyPageState() {
    _presenter = new CryptoListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _presenter.loadCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return new PlatformScaffold(
            appBar:
                new PlatformAppBar(title: new Text('Cryptocurrency')).create(),
            body: _isLoading
                ? new Center(child: new CircularProgressIndicator())
                : _cryptoWidget())
        .create();
  }

  Widget _cryptoWidget() {
    return new Container(
        child: new Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            itemCount: _currencies.length,
            itemBuilder: (BuildContext context, int index) {
              final Crypto currency = _currencies[index];

              return _getListItemUi(currency);
            },
          ),
        )
      ],
    ));
  }

  Widget _getListItemUi(Crypto crypto) {
    return PlatformListItemHolder(
        child: ListTile(
      leading: new CachedNetworkImage(
        placeholder: new Icon(FontAwesomeIcons.bitcoin),
        imageUrl: crypto.getImageUrl(),
      ),
      title: new Padding(
          padding: new EdgeInsets.only(bottom: 4.0),
          child: new Stack(
            children: <Widget>[
              new Text(crypto.name,
                  style: new TextStyle(fontWeight: FontWeight.bold)),
              new Align(
                  alignment: Alignment.centerRight,
                  child: new Text("\$${crypto.price_usd}"))
            ],
          )),
      subtitle: _getSubtitleText(crypto),
    )).create();
  }

  Widget _getSubtitleText(Crypto crypto) {
    return new RichText(
        text: new TextSpan(children: [
      _getDefaultTextSpan("1h: "),
      _getPercentageChangeSubtitle(crypto.percent_change_1h),
      _getDefaultTextSpan("  24h: "),
      _getPercentageChangeSubtitle(crypto.percent_change_24h),
      _getDefaultTextSpan("  7d: "),
      _getPercentageChangeSubtitle(crypto.percent_change_7d)
    ]));
  }

  TextSpan _getPercentageChangeSubtitle(double change) {
    return new TextSpan(
        text: "$change%",
        style: new TextStyle(color: change > 0 ? Colors.green : Colors.red));
  }

  TextSpan _getDefaultTextSpan(String text) =>
      TextSpan(text: text, style: TextStyle(color: Colors.black));

  @override
  void onLoadCryptoComplete(List<Crypto> items) {
    setState(() {
      _currencies = items;
      _isLoading = false;
    });
  }

  @override
  void onLoadCryptoError() {}
}

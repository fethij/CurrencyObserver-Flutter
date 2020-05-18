import 'package:currencyobserverflutter/currencies_page.dart';
import 'package:currencyobserverflutter/cryptocurrency_page.dart';
import 'package:currencyobserverflutter/platform/platform_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => new _MainNavigationState();
}

class _MainNavigationState extends PlatformState<MainNavigation>
    with SingleTickerProviderStateMixin {
  int index = 0;

  @override
  Widget buildAndroidWidget(BuildContext context) {
    return new Scaffold(
        body: new Stack(
          children: <Widget>[
            new Offstage(
              offstage: index != 0,
              child: new TickerMode(
                enabled: index == 0,
                child: new MaterialApp(home: new CurrencyPage()),
              ),
            ),
            new Offstage(
              offstage: index != 1,
              child: new TickerMode(
                enabled: index == 1,
                child: new MaterialApp(home: new CryptocurrencyPage()),
              ),
            ),
          ],
        ),
        bottomNavigationBar: new BottomNavigationBar(
          currentIndex: index,
          onTap: (int index) {
            setState(() {
              this.index = index;
            });
          },
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: new Icon(Icons.attach_money),
                title: new Text("Currency"),
                backgroundColor: Colors.cyan),
            new BottomNavigationBarItem(
                icon: new Icon(FontAwesomeIcons.bitcoin),
                title: new Text("Cryptocurrency"),
                backgroundColor: Colors.lightGreen),
          ],
        )); //scaffold
  }

  @override
  Widget buildIosWidget(BuildContext context) {
    return new CupertinoTabScaffold(
      tabBar: new CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: new Icon(Icons.attach_money),
            title: new Text("Currency"),
          ),
          BottomNavigationBarItem(
            icon: new Icon(FontAwesomeIcons.bitcoin),
            title: new Text("Cryptocurrency"),
          )
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return new CupertinoTabView(
          builder: (BuildContext context) {
            if (index == 0)
              return new MaterialApp(home: new CurrencyPage());
            else
              return new MaterialApp(home: new CryptocurrencyPage());
          },
        );
      },
    );
  }
}

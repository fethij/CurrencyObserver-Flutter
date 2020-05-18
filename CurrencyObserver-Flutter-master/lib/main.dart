import 'package:currencyobserverflutter/dependency_injection.dart';
import 'package:currencyobserverflutter/main_navigation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  Injector.configure(Flavor.PROD);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData iOSTheme = new ThemeData(
    primarySwatch: Colors.pink,
    primaryColor: Colors.blue[300],
    primaryColorBrightness: Brightness.light,
  );

  final ThemeData defaultTheme = new ThemeData(
    primarySwatch: Colors.purple,
    accentColor: Colors.pink,
  );

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme:
          defaultTargetPlatform == TargetPlatform.iOS ? iOSTheme : defaultTheme,
      home: new MainNavigation(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

abstract class PlatformWidgetCreator<I extends R, A extends R,
    R extends Widget> {
  R create() {
    if (Platform.isAndroid) {
      return createAndroidWidget();
    } else if (Platform.isIOS) {
      return createIosWidget();
    }
    // platform not supported returns an empty widget
    return null;
  }

  I createIosWidget();

  A createAndroidWidget();
}

class PlatformScaffold
    extends PlatformWidgetCreator<CupertinoPageScaffold, Scaffold, Widget> {
  final PreferredSizeWidget appBar;
  final Widget body;

  PlatformScaffold({
    this.appBar,
    this.body,
  });

  @override
  Scaffold createAndroidWidget() => Scaffold(appBar: appBar, body: body);

  @override
  CupertinoPageScaffold createIosWidget() =>
      CupertinoPageScaffold(navigationBar: appBar, child: body);
}

class PlatformAppBar extends PlatformWidgetCreator<CupertinoNavigationBar,
    AppBar, PreferredSizeWidget> {
  final Widget leading;
  final Widget title;

  PlatformAppBar({
    this.leading,
    this.title,
  });

  @override
  CupertinoNavigationBar createIosWidget() => CupertinoNavigationBar(
        leading: leading,
        middle: title,
      );

  @override
  AppBar createAndroidWidget() => AppBar(
        leading: leading,
        title: title,
        elevation: 5.0,
      );
}

class PlatformListItemHolder
    extends PlatformWidgetCreator<Material, Card, Widget> {
  final Widget child;

  PlatformListItemHolder({this.child});

  @override
  Material createIosWidget() => Material(child: child);

  @override
  Card createAndroidWidget() => Card(child: child);
}

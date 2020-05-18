import 'package:flutter/material.dart';
import 'dart:io' show Platform;

abstract class PlatformState<S extends StatefulWidget> extends State<S> {

  @override
  Widget build(BuildContext context) {
    if(Platform.isAndroid) {
      return buildAndroidWidget(context);
    } else if (Platform.isIOS) {
      return buildIosWidget(context);
    }
    // platform not supported returns an empty widget
    return new Container();
  }

  Widget buildIosWidget(BuildContext context);

  Widget buildAndroidWidget(BuildContext context);

}
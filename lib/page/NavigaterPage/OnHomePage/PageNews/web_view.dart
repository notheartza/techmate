import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebView extends StatelessWidget {
  final String Url;
  const WebView({Key key, this.Url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url: this.Url);
  }
}

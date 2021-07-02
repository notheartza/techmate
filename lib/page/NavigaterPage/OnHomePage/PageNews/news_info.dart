import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/PageNews/web_view.dart';


class NewsInfo extends StatefulWidget {
  @override
  _NewsInfoPage createState() => _NewsInfoPage();
}

class _NewsInfoPage extends State<NewsInfo> {
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  @override
  Widget build(BuildContext context) {
    SnackBar _support() {
      return SnackBar(
        content: Text('ขอบคุณที่สนับสนุน'),
        duration: Duration(seconds: 3),
      );
    }
    String Url = ModalRoute.of(context).settings.arguments;
    print(Url);

    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
        actions: <Widget>[
          IconButton(
                icon: Icon(Icons.dehaze),
                onPressed: (){
                  return showDialog(
                      context: context,
                    builder: (context){
                        return AlertDialog(
                          title: Text('Hello'),
                        );
                    }
                  );
                },
              )
        ],
      ),
      body: WebView(Url: Url,),
    );

  }

}

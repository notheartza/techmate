import "package:flutter/material.dart";
import 'package:techsmate/page/HomePage.dart';
import 'package:techsmate/page/LoginPage.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/PageChat/chat_view.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/PageCompany/Info/new_work.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/PageCompany/home_company.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/PageNews/news_info.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/PageShop/ShopInfo.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      title: "Tech's Mate",
      routes: {
        '/Home-Page': (context) => HomePage(),
        '/NewsInfo-Page' : (context) => NewsInfo(),
        '/Login-Page': (context) => LoginPage(),
        '/ShopInfo-Page': (context) => ShopInfoPage(),
        '/HomeCompany-Page': (context) => HomeCompany(),
        '/NewWork-Page': (context) => NewWork(),
        '/ChatView-Page': (context) => ChatView()

      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/PageNews/NewsOnDate.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/PageNews/RecommendNews.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/PageNews/TypeNews.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.blueAccent,
          appBar: PreferredSize(
              child: TabBar(
                indicator: UnderlineTabIndicator(borderSide: BorderSide(width: 5,color: Colors.white)),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                //unselectedLabelStyle: TextStyle(color: Colors.redAccent),
                tabs: <Widget>[
                  Tab(
                     text: 'ข่าวล่าสุด',
                  ),
                  Tab(
                     text: 'แนะนำ',
                  ),
                  Tab(
                     text: 'ประเภท',
                  )
                ],
              ),
              preferredSize: Size.fromHeight(kToolbarHeight+20)),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              NewsDatePage(),
              RecommendNewsPage(),
              TypeNewsPage()

            ],

          )),
    );
  }

}
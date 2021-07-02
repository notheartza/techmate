import 'package:flutter/material.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/PageAnalysis/advisor_page.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/PageAnalysis/analysis_page.dart';

class AnalysisHomePage extends StatefulWidget {
  @override
  _AnalysisHomePageState createState() => _AnalysisHomePageState();
}

class _AnalysisHomePageState extends State<AnalysisHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: PreferredSize(
          child: TabBar(
            indicator: UnderlineTabIndicator(borderSide: BorderSide(width: 5,color: Colors.white)),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: "ที่ปรึกษา",
              ),
              Tab(
                text: "วิเคราะห์ข้อมูล",
              )
            ],
          ),
          preferredSize: Size.fromHeight(kToolbarHeight+20),
        ),
        body: TabBarView(
          children: <Widget>[
              AdvisorPage(),
              AnalysisPage()
          ],
        ),
      ),
    ),);
  }

}

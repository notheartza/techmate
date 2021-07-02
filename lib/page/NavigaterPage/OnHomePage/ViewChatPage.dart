import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:techsmate/models/ChatView.dart';
import 'package:techsmate/models/Login.dart';
import 'package:techsmate/models/ReqCompany.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/PageChat/mind_share.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/PageChat/mychat.dart';


class ViewChatPage extends StatefulWidget {
  final User data;

  const ViewChatPage({Key key, this.data}) : super(key: key);

  @override
  _ViewChatPageState createState() => _ViewChatPageState();
}

class _ViewChatPageState extends State<ViewChatPage> {
  @override
  Widget build(BuildContext context) {
    User users = widget.data;
    return DefaultTabController(
      length: 2,
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
                icon: Icon(Icons.chat), text: 'แชทของฉัน',
              ),
              Tab(
                icon: Icon(Icons.forum), text: 'MindShare',
              )
            ],
          ),
            preferredSize: Size.fromHeight(kToolbarHeight+20),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Mychat(data: users,),
            MindShare()
          ],

        ),
      ),
    );
  }

}

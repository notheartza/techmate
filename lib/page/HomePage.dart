import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techsmate/models/Login.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/AnalysisPage.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/CompanyPage.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/NewsPage.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/ShopPage.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/ViewChatPage.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  double hight = 0;
  User _users = User();
  var img = 'http://178.128.56.0/Image/Profile.png';
  var placeholder = 'Img/ImgUser.png';


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     _users = ModalRoute.of(context).settings.arguments;


    print("User is${_users.userId}");

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            children: <Widget>[
              Container(
                color: Colors.blue,
                height: 130,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                'สวัสดี, คุณ' + _users.userName,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 200,
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.notifications_none),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'แจ้งเตือน',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: FadeInImage.assetNetwork(
                          placeholder: placeholder,
                          image: img,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      PopupMenuButton<int>(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: Text('Profile'),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: Text('About'),
                          ),
                          PopupMenuItem(
                            value: 3,
                            child: Text('Logout'),
                          )
                        ],
                        onCanceled: () {
                          print("You have canceled the menu.");
                        },
                        onSelected: (value) {
                          print("value:$value");
                          if (value == 3) {
                            Navigator.pushNamed(context, '/Login-Page');
                          }
                        },
                        icon: Icon(
                          Icons.settings,
                          size: 30,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
              child: _ShowWigets(_index, _users)
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.blueAccent),
              title:
                  (Text('ร้านค้า', style: TextStyle(color: Colors.blueAccent))),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books, color: Colors.blueAccent),
              title:
                  (Text('ข่าวสาร', style: TextStyle(color: Colors.blueAccent))),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.business, color: Colors.blueAccent),
              title:
                  (Text('บริษัท', style: TextStyle(color: Colors.blueAccent))),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.language, color: Colors.blueAccent),
              title: (Text(
                'โซเชียล',
                style: TextStyle(color: Colors.blueAccent),
              )),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart, color: Colors.blueAccent),
              title: (Text(
                'วิเคราะห์ข้อมูล',
                style: TextStyle(color: Colors.blueAccent),
              )),
              backgroundColor: Colors.white)
        ],
        onTap: (i,) {
          setState(() {
            _index = i;
            print(_users.userId);
            _users = _users;

          });
        },
      ),
    );
  }

  Widget _ShowWigets(int index,User data){
    List<Widget> showWidgets  = [
      ShopPage(),
      NewsPage(),
      CompanyPage(data: data),
      ViewChatPage(data: data),
      AnalysisHomePage()
    ];
    return showWidgets[index];
  }
}

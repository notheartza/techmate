import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techsmate/models/Company.dart';
import 'package:techsmate/models/Login.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/PageCompany/Info/check_work.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/PageCompany/Info/company_member.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/PageCompany/Info/work.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/PageCompany/Info/work_meeting.dart';


class HomeCompany extends StatefulWidget {
  HomeCompany({Key key}) : super(key: key);

  @override
  _HomeCompanyState createState() => _HomeCompanyState();
}

class _HomeCompanyState extends State<HomeCompany>
    with TickerProviderStateMixin {
  int countChat = 6;
  TabController _tabController;


  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments as Map;
    User users = arguments['User'];
    ItemCompany Company = arguments['Company'];
    print('Type: ${Company.isCompany}');
    return Scaffold(
      body: Stack(
        children: <Widget>[
          NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: Text(Company.name),
                  actions: <Widget>[
                    Stack(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.message),
                          onPressed: () {
                            setState(() {
                              countChat = 0;
                            });
                          },
                        ),
                        (countChat != 0)
                            ? Positioned(
                                right: 10,
                                top: 10,
                                child: Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    constraints: BoxConstraints(
                                        minWidth: 16, minHeight: 14),
                                    child: Center(
                                      child: Text(
                                        countChat.toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    )),
                              )
                            : Container()
                      ],
                    ),
                    PopupMenuButton<int>(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 1,
                          child: Text('ตั้งค่า'),
                        ),
                        PopupMenuItem(
                          value: 2,
                          child: Text('เกี่ยวกับ'),
                        ),
                        PopupMenuItem(
                          value: 3,
                          child: Text('ออกจากบริษัท'),
                        )
                      ],
                      onCanceled: () {
                        print("You have canceled the menu.");
                      },
                      onSelected: (value) {
                        print("value:$value");
                      },
                      icon: Icon(Icons.dehaze),
                    )
                  ],
                  bottom: PreferredSize(
                    preferredSize: Size(0, kToolbarHeight),
                    child:
                  DefaultTabController(
                      length: 4,
                      child:  TabBar(
                            controller: _tabController,
                                  isScrollable: true,
                                  tabs: <Widget>[
                                    Tab(
                                      text: 'งานที่ได้รับ',
                                    ),
                                    Tab(
                                      text: 'นัดหมาย',
                                    ),
                                    Tab(
                                      text: 'สมาชิก',
                                    ),
                                    Tab(
                                      text: 'ตรวจสอบ/มอบหมายงาน',
                                    ),
                                  ],
                                )
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller:  _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Work(),
                WorkMeeting(),
                CompanyMember(company: Company,users: users,),
                CheckWork()
              ],
            )
          ),
        ],
      ),
    );
  }
}

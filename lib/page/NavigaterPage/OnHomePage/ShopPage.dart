import 'package:flutter/material.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/PageShop/Hardware.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/PageShop/ShopList.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/PageShop/Software.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage>  {


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
                    icon: Icon(Icons.devices), text: 'อุปกรณ์',
                  ),
                  Tab(
                    icon: Icon(Icons.get_app), text: 'ซอฟแวร์',
                  ),
                  Tab(
                    icon: Icon(Icons.apps), text: 'เกี่ยวกับฉัน',
                  )
                ],
              ),
              preferredSize: Size.fromHeight(kToolbarHeight+20)),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              HardwarePage(),
              SoftwarePage(),
              ShopListPage()
            ],

          )),
    );

  }
}


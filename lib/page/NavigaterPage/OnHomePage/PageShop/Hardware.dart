import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:techsmate/models/StoreView.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class HardwarePage extends StatefulWidget {
  @override
  _HardwarePageState createState() => _HardwarePageState();
}

class _HardwarePageState extends State<HardwarePage> {
  var img = 'http://178.128.56.0/Image/Image_IOT.jpg';
  var placeholder = 'Img/ImgUser.png';
  var NoImage = 'Img/NoImage.png';
  bool enabled = false;
  List<Store> StoreView;
  ViewStore getData;

  // ignore: non_constant_identifier_names
  Future<ViewStore> _StoreData(BuildContext context) async {
    ViewStore getJson;
    var response = await http.get('http://178.128.56.0:5000/StoreView',
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    print('Connecting');
    if (response.statusCode == 200) {
      print('Connected');
      getJson = ViewStore.fromJson(jsonDecode(response.body.toString()));
      print(getJson.totalData);
    }
    return getJson;
  }

  // ignore: non_constant_identifier_names
  _Add_cart() {
    final snackBar = SnackBar(
      content: Text('เพิ่มสินค้าเข้ารถเข็นเรียบร้อย'),
      action: SnackBarAction(
        label: 'ตรวจสอบ',
        onPressed: () {},
      ),
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: ClampingScrollPhysics(),
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'แนะนำ: ',
                  style: TextStyle(fontSize: 18),
                ),
                InkWell(
                    onTap: () {
                      print('All');
                    },
                    child: Text(
                      'ทั้งหมด',
                      style: TextStyle(color: Colors.blueAccent),
                    )),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.width / 1.7,
            child: FutureBuilder(
              future: _StoreData(context),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  //print("Check");
                  //print(snapshot.data.toJson());
                  this.getData = snapshot.data;
                  this.StoreView = getData.store;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: StoreView.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var price = FlutterMoneyFormatter(
                          amount: StoreView.elementAt(index).price.roundToDouble(),
                        settings: MoneyFormatterSettings(
                          symbol: '฿',
                          thousandSeparator: ',',
                          decimalSeparator: '.',
                          fractionDigits: 2,
                          compactFormatType: CompactFormatType.short
                        )
                      );
                      return GestureDetector(
                        onTap: () {
                          print('Device1');
                          Navigator.pushNamed(context, '/ShopInfo-Page',arguments: index);
                        },
                        child: Card(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              child: CachedNetworkImage(
                                height: MediaQuery.of(context).size.width / 3,
                                width: MediaQuery.of(context).size.width / 2.5,
                                imageUrl: img,
                                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) => Image.asset(NoImage),
                              )
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        StoreView.elementAt(index).name,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(StoreView.elementAt(index).companyName,
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      Text(price.output.symbolOnLeft,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      RatingBarIndicator(
                                        direction: Axis.horizontal,
                                        rating: StoreView.elementAt(index)
                                            .rating
                                            .toDouble(),
                                        itemCount: 5,
                                        itemSize: 20,
                                        unratedColor: Colors.blue.withAlpha(50),
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                    ],
                                  ),
                                  (StoreView.elementAt(index).companyName=='พลอยสยาม') ?
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                    Icon(Icons.beenhere, color: Colors.green,)
                                  ],):
                                  Container()
                                ],
                              ),
                            ),
                          ],
                        )),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'ประเภท: ',
                    style: TextStyle(fontSize: 16),
                  ),
                  InkWell(
                      onTap: () {
                        print('All');
                      },
                      child: Text(
                        'เลือก',
                        style: TextStyle(color: Colors.blueAccent),
                      )),
                ],
              )),
          FutureBuilder(
            future: _StoreData(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //print("Check");
                //print(snapshot.data.toJson());
                this.getData = snapshot.data;
                this.StoreView = getData.store;
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.8),
                  shrinkWrap: true,
                  itemCount: StoreView.length,
                  physics: ClampingScrollPhysics(),
                  //scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var price = FlutterMoneyFormatter(
                        amount: StoreView.elementAt(index).price.roundToDouble(),
                        settings: MoneyFormatterSettings(
                            symbol: '฿',
                            thousandSeparator: ',',
                            decimalSeparator: '.',
                            fractionDigits: 2,
                            compactFormatType: CompactFormatType.short
                        )
                    );
                    return GestureDetector(
                      onTap: () {
                        print('Device1');
                        Navigator.pushNamed(context, '/ShopInfo-Page',arguments: index);
                      },
                      child: Card(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: CachedNetworkImage(
                              height: MediaQuery.of(context).size.width / 3,
                              width: MediaQuery.of(context).size.width / 2,
                              imageUrl: img,
                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Image.asset(NoImage),
                            )
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      StoreView.elementAt(index).name,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(StoreView.elementAt(index).companyName,
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    Text(price.output.symbolOnLeft,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    RatingBarIndicator(
                                      direction: Axis.horizontal,
                                      rating: StoreView.elementAt(index)
                                          .rating
                                          .toDouble(),
                                      itemCount: 5,
                                      itemSize: 20,
                                      unratedColor: Colors.blue.withAlpha(50),
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ],
                                ),
                                (StoreView.elementAt(index).companyName=='พลอยสยาม') ?
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.beenhere, color: Colors.green,)
                                  ],):
                                Container()
                              ],
                            ),
                          ),
                        ],
                      )),
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

/*
IconButton(

                                              tooltip: 'ใส่ตระกร้า',
                                              key: _keyRed,
                                              icon: Icon(Icons.add_shopping_cart),
                                              onPressed: _Add_cart,
                                            ),

*/

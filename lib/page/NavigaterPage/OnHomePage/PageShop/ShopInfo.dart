import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ShopInfoPage extends StatefulWidget {
  @override
  _ShopInfoPageState createState() => _ShopInfoPageState();
}

class _ShopInfoPageState extends State<ShopInfoPage> {
  var img = 'http://178.128.56.0/Image/Profile.png';
  var placeholder = 'Img/ImgUser.png';
  var NoImage = 'Img/NoImage.png';
  var price = FlutterMoneyFormatter(
      amount: Random().nextInt(500000).toDouble(),
      settings: MoneyFormatterSettings(
          symbol: '฿',
          thousandSeparator: ',',
          decimalSeparator: '.',
          fractionDigits: 2,
          compactFormatType: CompactFormatType.short
      )
  );

  var red = Random().nextInt(5);
  @override
  Widget build(BuildContext context) {
    int type = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('ShopInfo'),
        ),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CarouselSlider(
                  height: 200.0,
                  items: [
                    'http://178.128.56.0/Image/Image_IOT.jpg',
                    'https://static.posttoday.com/media/content/2019/03/23/2953FF4335E54BFA899F59D822D5F54B.jpg'
                  ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            child: CachedNetworkImage(
                          height: MediaQuery.of(context).size.width / 3,
                          width: MediaQuery.of(context).size.width / 2.5,
                          imageUrl: i,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Image.asset(NoImage),
                        ));
                      },
                    );
                  }).toList(),
                ),
                Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(price.output.symbolOnLeft),
                                Text(
                                  'IOT1',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.share)
                              ],
                            )
                          ],
                        ),
                        RatingBarIndicator(
                          direction: Axis.horizontal,
                          rating:Random().nextInt(5).toDouble(),
                          itemCount: 5,
                          itemSize: 20,
                          unratedColor: Colors.blue.withAlpha(50),
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.blueAccent,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("\nลักษณะ : \n"),
                            (type==0)? Text("\nขาย\n"): (type==1)? Text("\nLicense\n"): Text("\nตัวทดลอง/ทดสอบ\n")
                          ],
                        ),
                        Container(width: MediaQuery.of(context).size.width, height: 1, color: Colors.grey,),
                        Text('\nรายละเอียด\nอุปกรณ์....\nใช้ทำ....\nมีหลาย....\nสามารทำกับ....\nผ่านการ.....\nสเปคของ.....\n'),
                        Container(width: MediaQuery.of(context).size.width, height: 1, color: Colors.grey,),
                        Text('\nความคิดเห็น/คะแนน\n\n', style: TextStyle(fontWeight: FontWeight.bold)),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text("${red}/5",style: TextStyle(fontWeight: FontWeight.bold),),
                                  RatingBarIndicator(
                                    direction: Axis.horizontal,
                                    rating: red.toDouble(),
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
                              Container(width: 1,height: 10,),
                              Row(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: FadeInImage.assetNetwork(
                                      placeholder: placeholder,
                                      image: img,
                                      height: 40,
                                      width: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text('  นาย เอบีซี', style: TextStyle(fontWeight: FontWeight.bold),)
                                ],
                              ),
                              Text('\nของใช้ได้ดี\n\n'),
                              Text('คำถามเกี่ยวกับสินค้า\n\n', style: TextStyle(fontWeight: FontWeight.bold)),
                              Row(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: FadeInImage.assetNetwork(
                                      placeholder: placeholder,
                                      image: img,
                                      height: 40,
                                      width: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text('  นาย เอบีซี', style: TextStyle(fontWeight: FontWeight.bold),)
                                ],
                              ),
                              Text('\nของยังมีอยู่ไหม\n'),
                              Row(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: FadeInImage.assetNetwork(
                                      placeholder: placeholder,
                                      image: img,
                                      height: 40,
                                      width: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text('  นาย บีเล', style: TextStyle(fontWeight: FontWeight.bold),)
                                ],
                              ),
                              Text('\nถ้าเสียส่งซ่อมได้ไหมครับ\n'),
                            ],
                          ),
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
        ), bottomNavigationBar: Container(
      
      margin: EdgeInsets.only(right: 10),
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          (type==0)? RaisedButton(
            color: Colors.blueAccent,
            onPressed: () {},
            child: Text('ซื้อ',style: TextStyle(color: Colors.white),),
          ): (type==1)? RaisedButton(
            onPressed: () {},
            color: Colors.blueAccent,
            child: Text('สมัครสมาชิก',style: TextStyle(color: Colors.white),),
          ):RaisedButton(
      onPressed: () {},
              color: Colors.blueAccent,
      child: Text('สนับสนุน',style: TextStyle(color: Colors.white),))
        ],
    )),);
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:techsmate/page/NavigaterPage/OnHomePage/PageNews/comment_news.dart';

class MindShare extends StatefulWidget {
  MindShare({Key key}) : super(key: key);

  @override
  _MindShareState createState() => _MindShareState();
}

class _MindShareState extends State<MindShare> {
  var img = 'http://178.128.56.0/Image/Profile.png';
  var placeholder = 'Img/ImgUser.png';
  List<bool> like = [];
  List<int> countLike = [];

  _onPressed(List<bool> like,int index) {
    print(like);
    print(countLike);
    setState(() {
      if(!like[index]){
        countLike[index]++;
      }else{
        countLike[index]--;
      }
      like[index] = !like.elementAt(index);
    });
  }

  _CommentButtonPressed(){
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => CommentNews(),));
    });
  }

  @override
  Widget build(BuildContext context) {
    like.add(false);
    countLike.add(Random().nextInt(50));
    like.add(false);
    countLike.add(Random().nextInt(50));
    return  Container(
      color: Colors.white,
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: Card(

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                          Container(
                            width: 15,
                            height: 1,
                          ),
                          Text(
                            "ผู้ใช้ที่1"
                          ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          Text("  20:30",style: TextStyle(fontSize: 10,color: Colors.grey),)
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10,bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 2,
                        color: Colors.grey,
                      ),
                      Text("  บริษัทเทพมหาชนต้องการนักพัฒนาแอปพคลิเคชัน Android 2 ตำแหน่ง มีค่าตอบแทนให้ครับ"),
                      Container(
                        margin: EdgeInsets.only(top: 10,bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 2,
                        color: Colors.grey,
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            iconSize: 35,
                            icon: Icon(
                              like.elementAt(0)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: like.elementAt(0) ? Colors.red : null,
                            ),
                            onPressed: () => _onPressed(like,0),
                          ),
                          (countLike[0] > 0) ? Text(countLike[0].toString() ,style: TextStyle(color: Colors.grey),): Container()
                          ,
                          IconButton(
                            iconSize: 35,
                            icon: Icon(Icons.chat_bubble_outline),
                            onPressed: () => _CommentButtonPressed(),
                          ), IconButton(icon: Icon(Icons.near_me), onPressed: (){

                          },color: Colors.blueAccent,)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Card(

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                          Container(
                            width: 15,
                            height: 1,
                          ),
                          Text(
                            "ผู้ใช้ที่2"
                            ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          Text("  20:30",style: TextStyle(fontSize: 10,color: Colors.grey),)
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10,bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 2,
                        color: Colors.grey,
                      ),
                      Text("  มีบริษัทไหนเคยพัฒนาระบบเช่าห้องพักไหมครับ ขอซื้อหน่อยได้ไหมครับ"),
                      Container(
                        margin: EdgeInsets.only(top: 10,bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 2,
                        color: Colors.grey,
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            iconSize: 35,
                            icon: Icon(
                              like.elementAt(1)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: like.elementAt(1) ? Colors.red : null,
                            ),
                            onPressed: () => _onPressed(like,1),
                          ),
                          (countLike[1] > 0) ? Text(countLike[1].toString() ,style: TextStyle(color: Colors.grey),): Container()
                          ,
                          IconButton(
                            iconSize: 35,
                            icon: Icon(Icons.chat_bubble_outline),
                            onPressed: () => _CommentButtonPressed(),
                          ), IconButton(icon: Icon(Icons.near_me), onPressed: (){

                          },color: Colors.blueAccent,)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
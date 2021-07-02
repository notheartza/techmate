import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:loadany/loadany_widget.dart';
import 'package:techsmate/models/NewsModels.dart';
import 'package:techsmate/models/StoreView.dart';
import 'package:http/http.dart' as http;

import 'comment_news.dart';

class RecommendNewsPage extends StatefulWidget {
  @override
  _RecommendNewsPageState createState() => _RecommendNewsPageState();
}

class _RecommendNewsPageState extends State<RecommendNewsPage> {
  var img = 'http://178.128.56.0/Image/Image_IOT.jpg';
  var placeholder = 'Img/ImgUser.png';
  var NoImage = 'Img/NoImage.png';
  bool enabled = false;
  List<Article> NewsView;
  News getData;
  List<bool> like = [];
  List<int> countLike = [];
  bool showlikeOverlay = false;

  _onPressed(List<bool> like,int index) {
    print(like);
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

  // ignore: non_constant_identifier_names
  Future<News> _NewsData(BuildContext context) async {
    News getJson;

    var response = await http.get(
        'http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=ddd38a270ab14301ae09e5a80f0db98f',
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    print('Connecting');
    if (response.statusCode == 200) {
      print('Connected');
      getJson = News.fromJson(jsonDecode(response.body.toString()));
      print(getJson.totalResults);
      http.Client().close();
    }


    return getJson;
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: FutureBuilder(
        future: _NewsData(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //print("Check");
            //print(snapshot.data.toJson());
            this.getData = snapshot.data;
            this.NewsView = getData.articles;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: NewsView.length,
              physics: ClampingScrollPhysics(),
              //scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                String Date = NewsView.elementAt(index).publishedAt.toString();
                var Time = Date.split(".");
                like.add(false);
                countLike.add(Random().nextInt(50));
                Date = Time[0];
                return GestureDetector(
                  onTap: () {
                    print('Device1');
                    Navigator.pushNamed(context, '/NewsInfo-Page', arguments: NewsView.elementAt(index).url);
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
                                imageUrl:
                                (NewsView.elementAt(index).urlToImage != null)
                                    ? NewsView.elementAt(index).urlToImage
                                    : NoImage,
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Image.asset(NoImage),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, left: 10, bottom: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Text(
                                    NewsView.elementAt(index).title,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Text('บริษัท${index+1}', style: TextStyle(color: Colors.blueAccent, fontSize: 18),),
                                Text(
                                  Date,
                                  style: TextStyle(fontSize: 16),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10, bottom: 5),
                                  height: 2,
                                  color: Colors.grey,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        IconButton(
                                          iconSize: 35,
                                          icon: Icon(
                                            like.elementAt(index)
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: like.elementAt(index) ? Colors.red : null,
                                          ),
                                          onPressed: () => _onPressed(like,index),
                                        ),
                                        (countLike[index] > 0) ? Text(countLike[index].toString() ,style: TextStyle(color: Colors.grey),): Container()
                                        ,
                                        IconButton(
                                          iconSize: 35,
                                          icon: Icon(Icons.chat_bubble_outline),
                                          onPressed: () => _CommentButtonPressed(),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(Icons.monetization_on, color: Colors.blueAccent,),
                                          onPressed: (){
                                            final snackBar = SnackBar(
                                              content: Text('ขอบคุณที่สนับสนุน'),
                                              duration: Duration(seconds: 3),
                                            );
                                            Scaffold.of(context).showSnackBar(snackBar);
                                          },
                                        ),
                                        PopupMenuButton<String>(
                                          onSelected: (String value){
                                            setState(() {
                                              final snackBar = SnackBar(
                                                content: Text('เพิ่มเรียบร้อย'),
                                                duration: Duration(seconds: 3),
                                              );
                                              Scaffold.of(context).showSnackBar(snackBar);
                                            });
                                          },
                                          itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                                            const PopupMenuItem<String>(
                                              child: Text('เพิ่มรายการโปรด'),
                                              value: '0',)
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                )
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
    );
  }

}
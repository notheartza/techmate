import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:techsmate/models/GetChat.dart';
import 'package:techsmate/models/ReqRoom.dart';
import 'package:techsmate/models/SearchChat.dart';
import 'package:techsmate/models/SendChat.dart';
import 'package:techsmate/models/TextChat.dart';

class ChatView extends StatefulWidget {

  ChatView({Key key}) : super(key: key);

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  var img = 'http://178.128.56.0/Image/Profile.png';
  var placeholder = 'Img/ImgUser.png';
  String _myRoom;
  GetChat getChat;
  GetRoom getRoom;
  TextChat textChat;
  List<TextChatElement> myText;
  var _TextController = TextEditingController();

  Future<GetChat> _SearchChat(String myId, String contact) async {
    GetChat getJson;
    var reqSearchChat = SearchChat();
    reqSearchChat.ownerOne = myId;
    reqSearchChat.ownerTwo = contact;
    String jsonReq = searchChatToJson(reqSearchChat);
    print(" Req Search: ${jsonReq}");

    try {
      var response = await http.post('http://178.128.56.0:5000/SearchChatRoom',
          body: jsonReq,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});
      print('ConnectingCompany');
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('ConnectedCompany');
        getJson = GetChat.fromJson(jsonDecode(response.body.toString()));
        print(getJson.totalData);
      }
    } catch (e) {
      print(e);
    } finally {
      http.Client().close();
    }

    return getJson;
  }

  Future<TextChat> _ChatRoomData(BuildContext context, String Room_ID) async {
    TextChat getJson;
    var reqInfoCompany = ReqRoom();
    reqInfoCompany.chatRoomId = Room_ID;
    String jsonReq = reqRoomToJson(reqInfoCompany);
    print(jsonReq);
    try {
      var response = await http.post('http://178.128.56.0:5000/TextChat',
          body: jsonReq,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});
      print('ConnectingCompany');
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('ConnectedCompany');
        getJson = TextChat.fromJson(jsonDecode(response.body.toString()));
        print(getJson.totalData);
      }
    } catch (e) {
      print(e);
    } finally {
      http.Client().close();
    }
    return getJson;
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments as Map;
    String _myId = arguments['User'];
    String _contact = arguments['Contact'];
    String _nameContact = arguments['nameContact'];
    print('User : ' + _myId);
    print('Contact : ' + _contact);
    print('ContactName : ' + _nameContact);

    //print("Room"+_myRoom);

    return Scaffold(
      appBar: AppBar(
          title: Row(

        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: FadeInImage.assetNetwork(
                placeholder: placeholder,
                image: img,
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              )),
          Container(
            width: 10,
            height: 1,
          ),
          Text(_nameContact),
        ],
      )),
      body: FutureBuilder(
          future: (_contact[0]=='U')? _SearchChat(_myId, _contact): _SearchChat(_contact, "-"),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              this.getChat = snapshot.data;
              this.getRoom = getChat.getRoom[0];
              _myRoom = getRoom.roomId;
              print(_myRoom);
              return FutureBuilder(
                  future: _ChatRoomData(context, _myRoom),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      this.textChat = snapshot.data;
                      if(textChat.room[0].textChat.length!=0){
                        this.myText = textChat.room[0].textChat;
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: myText.length,
                            itemBuilder: (context, index){
                              return Padding(

                                padding: const EdgeInsets.only(top: 10,bottom: 10),
                                child: Row(
                                  mainAxisAlignment: (_myId==myText.elementAt(index).owner)? MainAxisAlignment.end: MainAxisAlignment.start ,
                                  children: <Widget>[
                                    Text(myText.elementAt(index).userName),
                                    Material(
                                      color: (_myId==myText.elementAt(index).owner)? Colors.blueAccent : Colors.grey,
                                      borderRadius: BorderRadius.circular(10.0),
                                      elevation: 6.0,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                        child: Text(myText.elementAt(index).text, style: TextStyle(color: (_myId==myText.elementAt(index).owner)? Colors.white: Colors.black),),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            });
                      }else{
                        return Center(
                          child: Text("ทักทายเพื่อเริ่มการสนทนากับ${_nameContact}",style: TextStyle(color: Colors.grey,fontSize: 16),),
                        );
                      }

                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: <Widget>[
            Expanded(
                child: TextFormField(
                  onChanged: (text){

                  },
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              style: TextStyle(fontSize: 18, height: 2.0),
              textAlign: TextAlign.start,
              controller: _TextController,
              decoration: InputDecoration(
                hintText: 'Aa',
                labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )),
            IconButton(
              onPressed: () async {
                if(_TextController.text!=""){
                  var reqSendChat = SendChat();
                  reqSendChat.text = _TextController.text;
                  reqSendChat.userId = _myId;
                  reqSendChat.chatRoomId = _myRoom;
                  String jsonReq = sendChatToJson(reqSendChat);
                  print(jsonReq);

                  var response = await http.post(
                      'http://178.128.56.0:5000/SendText',
                      body: jsonReq,
                      headers: {
                        HttpHeaders.contentTypeHeader:
                        'application/json'
                      });
                  setState(() {
                    _TextController.clear();
                  });
                }

              },
              icon:Icon(
                Icons.send,
                color: Colors.blueAccent,
              ),
            )
          ],
        ),
      ),
    );
  }

/* SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: me? CrossAxisAlignment.end: CrossAxisAlignment.start,
          children: <Widget>[
              Text(from),
            Material(
              color: me? Colors.blueAccent : Colors.grey,
              borderRadius: BorderRadius.circular(10.0),
              elevation: 6.0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(text),
              ),
            )
          ],
        ),
      ),
  */
}

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:techsmate/models/ChatView.dart';
import 'package:techsmate/models/Login.dart';
import 'package:techsmate/models/ReqCompany.dart';

class Mychat extends StatefulWidget {
  final User data;

  Mychat({Key key, this.data}) : super(key: key);

  @override
  _MychatState createState() => _MychatState();
}

class _MychatState extends State<Mychat> {
  var img = 'http://178.128.56.0/Image/Profile.png';
  var placeholder = 'Img/ImgUser.png';

  ChatView getData;
  List<Chat> MyChat;
  String TextDate;

  Future<ChatView> _ChatRoomData(BuildContext context, String User_ID) async {
    ChatView getJson;
    var reqUser = ReqCompany();
    reqUser.userId = User_ID;
    String jsonReq = reqCompanyToJson(reqUser);
    print(jsonReq);
    try {
      var response = await http.post('http://178.128.56.0:5000/ChatRoom',
          body: jsonReq,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});
      print('ConnectingCompany');
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('ConnectedCompany');
        getJson = ChatView.fromJson(jsonDecode(response.body.toString()));
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
  Widget build(BuildContext context) {
    User users = widget.data;
    return Container(
      color: Colors.white,
      child: FutureBuilder(
          future: _ChatRoomData(context, users.userId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              this.getData = snapshot.data;
              this.MyChat = getData.chat;


              return ListView.builder(
                shrinkWrap: true,
                itemCount: MyChat.length,
                itemBuilder: (context, index) {
                  String contact_ID;
                  if(MyChat.elementAt(index).room.ownerOne[0]=='U'){
                     contact_ID =
                    (MyChat.elementAt(index).room.ownerTwo !=
                        users.userId)
                        ? MyChat.elementAt(index).room.ownerTwo
                        : MyChat.elementAt(index).room.ownerOne;
                  }else{
                     contact_ID = MyChat.elementAt(index).room.ownerOne;
                  }
                  String contact;
                  if(MyChat.elementAt(index).room.name!="_//"){
                    contact = MyChat.elementAt(index).room.name;
                  }else{
                    contact = (MyChat.elementAt(index).room.ownerTwo !=
                        users.userId)
                        ? MyChat.elementAt(index).room.nameUser_Two
                        : MyChat.elementAt(index).room.nameUser_One;
                  }


                  if (MyChat.elementAt(index).textChat.length > 0) {
                    var get = MyChat.elementAt(index)
                        .textChat
                        .elementAt(MyChat.elementAt(index).textChat.length - 1)
                        .timeStamp;
                    print(get);
                    List<String> listdate = get.split(" ");
                    List<String> getDate =
                        '${listdate[0][0] + listdate[0][1] + listdate[0][2]} ${listdate[1]} ${listdate[2]} ${listdate[3]} ${listdate[4]}'
                            .split(" ");
                    List<String> today = DateFormat('EE dd MMM yyyy HH:mm:ss')
                        .format(DateTime.now())
                        .toString()
                        .split(" ");

                    if (getDate[0] == today[0] &&
                        getDate[1] == today[1] &&
                        getDate[2] == today[2] &&
                        getDate[3] == today[3]) {
                      var time = getDate[4].split(':');
                      TextDate = time[0] + ":" + time[1];
                    } else if(int.parse(getDate[1])+7<=int.parse(today[1])&&int.parse(getDate[1])>=int.parse(today[1])-7){
                      TextDate = getDate[0];
                    }else {
                      TextDate = "${getDate[1]} ${getDate[2]}";
                    }
                    return ListTile(
                        onTap: () {
                          print('${users.userId}:${contact_ID}:${contact}');
                          Navigator.pushNamed(context, '/ChatView-Page',
                              arguments: {
                                'User': users.userId,
                                'Contact': contact_ID,
                                'nameContact': contact
                              });
                        },
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: FadeInImage.assetNetwork(
                            placeholder: placeholder,
                            image: img,
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text((MyChat.elementAt(index).room.name!="_//")? MyChat.elementAt(index).room.name: contact),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                                '${MyChat.elementAt(index).textChat.elementAt(MyChat.elementAt(index).textChat.length - 1).userName}: ${MyChat.elementAt(index).textChat.elementAt(MyChat.elementAt(index).textChat.length - 1).text} '),
                            Column(
                              children: <Widget>[
                                Icon(
                                  Icons.brightness_1,
                                  size: 5,
                                  color: Colors.grey,
                                ),
                                Container(
                                  height: 5,
                                  width: 1,
                                )
                              ],
                            ),
                            Text(" ${TextDate}")
                          ],
                        ));
                  } else {
                    return ListTile(
                        onTap: () {
                          print('${users.userId}:${contact_ID}:${contact}');
                          Navigator.pushNamed(context, '/ChatView-Page',
                              arguments: {
                                'User': users.userId,
                                'Contact': contact_ID,
                                'nameContact': contact
                              });
                        },
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: FadeInImage.assetNetwork(
                            placeholder: placeholder,
                            image: img,
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text((MyChat.elementAt(index).room.name!="_//")? MyChat.elementAt(index).room.name: contact),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text('ทักทายเพื่อเริ่มการสนทนา'),
                            Column(
                              children: <Widget>[
                                Icon(
                                  Icons.brightness_1,
                                  size: 5,
                                  color: Colors.grey,
                                ),
                                Container(
                                  height: 5,
                                  width: 1,
                                )
                              ],
                            ),
                            Text(" ${TextDate}")
                          ],
                        ));
                  }
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

// To parse this JSON data, do
//
//     final chatView = chatViewFromJson(jsonString);

import 'dart:convert';

ChatView chatViewFromJson(String str) => ChatView.fromJson(json.decode(str));

String chatViewToJson(ChatView data) => json.encode(data.toJson());

class ChatView {
  int status;
  int totalData;
  List<Chat> chat;

  ChatView({
    this.status,
    this.totalData,
    this.chat,
  });

  factory ChatView.fromJson(Map<String, dynamic> json) => ChatView(
    status: json["status"],
    totalData: json["Total_Data"],
    chat: List<Chat>.from(json["Message"].map((x) => Chat.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "Total_Data": totalData,
    "Message": List<dynamic>.from(chat.map((x) => x.toJson())),
  };
}

class Chat {
  String cmId;
  String userId;
  String chatRoomId;
  String timeStamp;
  Room room;
  List<TextChat> textChat;

  Chat({
    this.cmId,
    this.userId,
    this.chatRoomId,
    this.timeStamp,
    this.room,
    this.textChat,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
    cmId: json["CM_ID"],
    userId: json["User_ID"],
    chatRoomId: json["ChatRoom_ID"],
    timeStamp: json["TimeStamp"],
    room: Room.fromJson(json["Room"]),
    textChat: List<TextChat>.from(json["TextChat"].map((x) => TextChat.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "CM_ID": cmId,
    "User_ID": userId,
    "ChatRoom_ID": chatRoomId,
    "TimeStamp": timeStamp,
    "Room": room.toJson(),
    "TextChat": List<dynamic>.from(textChat.map((x) => x.toJson())),
  };
}

class Room {
  String roomId;
  String name;
  String ownerOne;
  String ownerTwo;
  String timeStamp;
  String nameUser_One;
  String nameUser_Two;

  Room({
    this.roomId,
    this.name,
    this.ownerOne,
    this.ownerTwo,
    this.timeStamp,
    this.nameUser_One,
    this.nameUser_Two,
  });


  factory Room.fromJson(Map<String, dynamic> json) => Room(
    roomId: json["Room_ID"],
    name: json["Name"],
    ownerOne: json["Owner_One"],
    ownerTwo: json["Owner_Two"],
    timeStamp: json["TimeStamp"],
    nameUser_One: json["nameUser_One"],
    nameUser_Two: json["nameUser_Two"]
  );

  Map<String, dynamic> toJson() => {
    "Room_ID": roomId,
    "Name": name,
    "Owner_One": ownerOne,
    "Owner_Two": ownerTwo,
    "TimeStamp": timeStamp,
    "nameUser_One": nameUser_One,
    "nameUser_Two": nameUser_Two,
  };
}

class TextChat {
  String tcId;
  String text;
  String chatRoomId;
  String owner;
  String timeStamp;
  String userName;

  TextChat({
    this.tcId,
    this.text,
    this.chatRoomId,
    this.owner,
    this.timeStamp,
    this.userName,
  });

  factory TextChat.fromJson(Map<String, dynamic> json) => TextChat(
    tcId: json["TC_ID"],
    text: json["Text"],
    chatRoomId: json["ChatRoom_ID"],
    owner: json["Owner"],
    timeStamp: json["TimeStamp"],
    userName: json["UserName"],
  );

  Map<String, dynamic> toJson() => {
    "TC_ID": tcId,
    "Text": text,
    "ChatRoom_ID": chatRoomId,
    "Owner": owner,
    "TimeStamp": timeStamp,
    "UserName": userName,
  };
}

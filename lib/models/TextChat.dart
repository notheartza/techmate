// To parse this JSON data, do
//
//     final textChat = textChatFromJson(jsonString);

import 'dart:convert';

TextChat textChatFromJson(String str) => TextChat.fromJson(json.decode(str));

String textChatToJson(TextChat data) => json.encode(data.toJson());

class TextChat {
  int status;
  int totalData;
  List<Room> room;

  TextChat({
    this.status,
    this.totalData,
    this.room,
  });

  factory TextChat.fromJson(Map<String, dynamic> json) => TextChat(
    status: json["status"],
    totalData: json["Total_Data"],
    room: List<Room>.from(json["Message"].map((x) => Room.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "Total_Data": totalData,
    "Message": List<dynamic>.from(room.map((x) => x.toJson())),
  };
}

class Room {
  String roomId;
  String name;
  String ownerOne;
  String ownerTwo;
  String timeStamp;
  List<TextChatElement> textChat;

  Room({
    this.roomId,
    this.name,
    this.ownerOne,
    this.ownerTwo,
    this.timeStamp,
    this.textChat,
  });



  factory Room.fromJson(Map<String, dynamic> json) => Room(
    roomId: json["Room_ID"],
    name: json["Name"],
    ownerOne: json["Owner_One"],
    ownerTwo: json["Owner_Two"],
    timeStamp: json["TimeStamp"],
    textChat: List<TextChatElement>.from(json["TextChat"].map((x) => TextChatElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Room_ID": roomId,
    "Name": name,
    "Owner_One": ownerOne,
    "Owner_Two": ownerTwo,
    "TimeStamp": timeStamp,
    "TextChat": List<dynamic>.from(textChat.map((x) => x.toJson())),
  };
}

class TextChatElement {
  String tcId;
  String text;
  String chatRoomId;
  String owner;
  String timeStamp;
  String userName;

  TextChatElement({
    this.tcId,
    this.text,
    this.chatRoomId,
    this.owner,
    this.timeStamp,
    this.userName,
  });

  factory TextChatElement.fromJson(Map<String, dynamic> json) => TextChatElement(
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

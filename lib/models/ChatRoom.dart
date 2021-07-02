// To parse this JSON data, do
//
//     final chatRoom = chatRoomFromJson(jsonString);

import 'dart:convert';

import 'package:animated_widgets/generated/i18n.dart';

ChatRoom chatRoomFromJson(String str) => ChatRoom.fromJson(json.decode(str));

String chatRoomToJson(ChatRoom data) => json.encode(data.toJson());

class ChatRoom {
  int status;
  int totalData;
  List<Room> room;

  ChatRoom({
    this.status,
    this.totalData,
    this.room,
  });

  factory ChatRoom.fromJson(Map<String, dynamic> json) => ChatRoom(
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
  List<Member> member;

  Room({
    this.roomId,
    this.name,
    this.ownerOne,
    this.ownerTwo,
    this.timeStamp,
    this.member,
  });

  factory Room.fromJson(Map<String, dynamic> json) => Room(
    roomId: json["Room_ID"],
    name: json["Name"],
    ownerOne: json["Owner_One"],
    ownerTwo: json["Owner_Two"],
    timeStamp: json["TimeStamp"],
    member: List<Member>.from(json["Member"].map((x) => Member.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Room_ID": roomId,
    "Name": name,
    "Owner_One": ownerOne,
    "Owner_Two": ownerTwo,
    "TimeStamp": timeStamp,
    "Member": List<dynamic>.from(member.map((x) => x.toJson())),
  };
}

class Member {
  String cmId;
  String userId;
  String chatRoomId;
  String timeStamp;
  String userName;

  Member({
    this.cmId,
    this.userId,
    this.chatRoomId,
    this.timeStamp,
    this.userName,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
    cmId: json["CM_ID"],
    userId: json["User_ID"],
    chatRoomId: json["ChatRoom_ID"],
    timeStamp: json["TimeStamp"],
    userName: json["UserName"],
  );

  Map<String, dynamic> toJson() => {
    "CM_ID": cmId,
    "User_ID": userId,
    "ChatRoom_ID": chatRoomId,
    "TimeStamp": timeStamp,
    "UserName": userName,
  };
}

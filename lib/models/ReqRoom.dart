// To parse this JSON data, do
//
//     final reqRoom = reqRoomFromJson(jsonString);

import 'dart:convert';

ReqRoom reqRoomFromJson(String str) => ReqRoom.fromJson(json.decode(str));

String reqRoomToJson(ReqRoom data) => json.encode(data.toJson());

class ReqRoom {
  String chatRoomId;

  ReqRoom({
    this.chatRoomId,
  });

  factory ReqRoom.fromJson(Map<String, dynamic> json) => ReqRoom(
    chatRoomId: json["ChatRoom_ID"],
  );

  Map<String, dynamic> toJson() => {
    "ChatRoom_ID": chatRoomId,
  };
}

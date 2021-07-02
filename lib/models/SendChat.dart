// To parse this JSON data, do
//
//     final sendChat = sendChatFromJson(jsonString);

import 'dart:convert';

SendChat sendChatFromJson(String str) => SendChat.fromJson(json.decode(str));

String sendChatToJson(SendChat data) => json.encode(data.toJson());

class SendChat {
  String text;
  String chatRoomId;
  String userId;

  SendChat({
    this.text,
    this.chatRoomId,
    this.userId,
  });

  factory SendChat.fromJson(Map<String, dynamic> json) => SendChat(
    text: json["Text"],
    chatRoomId: json["ChatRoom_ID"],
    userId: json["User_ID"],
  );

  Map<String, dynamic> toJson() => {
    "Text": text,
    "ChatRoom_ID": chatRoomId,
    "User_ID": userId,
  };
}

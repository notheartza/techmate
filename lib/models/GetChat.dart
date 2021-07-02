// To parse this JSON data, do
//
//     final getChat = getChatFromJson(jsonString);

import 'dart:convert';

GetChat getChatFromJson(String str) => GetChat.fromJson(json.decode(str));

String getChatToJson(GetChat data) => json.encode(data.toJson());

class GetChat {
  int status;
  int totalData;
  List<GetRoom> getRoom;

  GetChat({
    this.status,
    this.totalData,
    this.getRoom,
  });

  factory GetChat.fromJson(Map<String, dynamic> json) => GetChat(
    status: json["status"],
    totalData: json["Total_Data"],
    getRoom: List<GetRoom>.from(json["Message"].map((x) => GetRoom.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "Total_Data": totalData,
    "Message": List<dynamic>.from(getRoom.map((x) => x.toJson())),
  };
}

class GetRoom {
  String roomId;
  String name;
  String ownerOne;
  String ownerTwo;
  String timeStamp;

  GetRoom({
    this.roomId,
    this.name,
    this.ownerOne,
    this.ownerTwo,
    this.timeStamp,
  });

  factory GetRoom.fromJson(Map<String, dynamic> json) => GetRoom(
    roomId: json["Room_ID"],
    name: json["Name"],
    ownerOne: json["Owner_One"],
    ownerTwo: json["Owner_Two"],
    timeStamp: json["TimeStamp"],
  );

  Map<String, dynamic> toJson() => {
    "Room_ID": roomId,
    "Name": name,
    "Owner_One": ownerOne,
    "Owner_Two": ownerTwo,
    "TimeStamp": timeStamp,
  };
}

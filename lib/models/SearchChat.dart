// To parse this JSON data, do
//
//     final searchChat = searchChatFromJson(jsonString);

import 'dart:convert';

SearchChat searchChatFromJson(String str) => SearchChat.fromJson(json.decode(str));

String searchChatToJson(SearchChat data) => json.encode(data.toJson());

class SearchChat {
  String ownerOne;
  String ownerTwo;

  SearchChat({
    this.ownerOne,
    this.ownerTwo,
  });

  factory SearchChat.fromJson(Map<String, dynamic> json) => SearchChat(
    ownerOne: json["Owner_One"],
    ownerTwo: json["Owner_Two"],
  );

  Map<String, dynamic> toJson() => {
    "Owner_One": ownerOne,
    "Owner_Two": ownerTwo,
  };
}

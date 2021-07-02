

import 'dart:convert';

ReqLogin reqLoginFromJson(String str) => ReqLogin.fromJson(json.decode(str));

String reqLoginToJson(ReqLogin data) => json.encode(data.toJson());

class ReqLogin {
  String userName;
  String passWord;

  ReqLogin({
    this.userName,
    this.passWord,
  });

  factory ReqLogin.fromJson(Map<String, dynamic> json) => ReqLogin(
    userName: json["UserName"],
    passWord: json["PassWord"],
  );

  Map<String, dynamic> toJson() => {
    "UserName": userName,
    "PassWord": passWord,
  };
}

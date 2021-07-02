// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  int status;
  int totalData;
  List<User> user;

  Login({
    this.status,
    this.totalData,
    this.user,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    status: json["status"],
    totalData: json["Total_Data"],
    user: List<User>.from(json["Message"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "Total_Data": totalData,
    "Message": List<dynamic>.from(user.map((x) => x.toJson())),
  };
}

class User {
  String userId;
  String email;
  String userName;
  String fullName;
  String sexal;
  int age;
  String occupation;
  String address;
  String provinces;
  String amphurs;
  String districts;
  String zipCode;
  String profileImg;
  String typeUser;
  String timestamp;

  User({
    this.userId,
    this.email,
    this.userName,
    this.fullName,
    this.sexal,
    this.age,
    this.occupation,
    this.address,
    this.provinces,
    this.amphurs,
    this.districts,
    this.zipCode,
    this.profileImg,
    this.typeUser,
    this.timestamp,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["User_ID"],
    email: json["Email"],
    userName: json["UserName"],
    fullName: json["FullName"],
    sexal: json["Sexal"],
    age: json["Age"],
    occupation: json["Occupation"],
    address: json["Address"],
    provinces: json["Provinces"],
    amphurs: json["Amphurs"],
    districts: json["Districts"],
    zipCode: json["ZipCode"],
    profileImg: json["ProfileImg"],
    typeUser: json["TypeUser"],
    timestamp: json["Timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "User_ID": userId,
    "Email": email,
    "UserName": userName,
    "FullName": fullName,
    "Sexal": sexal,
    "Age": age,
    "Occupation": occupation,
    "Address": address,
    "Provinces": provinces,
    "Amphurs": amphurs,
    "Districts": districts,
    "ZipCode": zipCode,
    "ProfileImg": profileImg,
    "TypeUser": typeUser,
    "Timestamp": timestamp,
  };
}

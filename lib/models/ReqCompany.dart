// To parse this JSON data, do
//
//     final reqCompany = reqCompanyFromJson(jsonString);

import 'dart:convert';

ReqCompany reqCompanyFromJson(String str) => ReqCompany.fromJson(json.decode(str));

String reqCompanyToJson(ReqCompany data) => json.encode(data.toJson());

class ReqCompany {
  String userId;

  ReqCompany({
    this.userId,
  });

  factory ReqCompany.fromJson(Map<String, dynamic> json) => ReqCompany(
    userId: json["User_ID"],
  );

  Map<String, dynamic> toJson() => {
    "User_ID": userId,
  };
}

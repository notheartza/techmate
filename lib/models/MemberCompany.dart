// To parse this JSON data, do
//
//     final memberCompany = memberCompanyFromJson(jsonString);

import 'dart:convert';

MemberCompany memberCompanyFromJson(String str) => MemberCompany.fromJson(json.decode(str));

String memberCompanyToJson(MemberCompany data) => json.encode(data.toJson());

class MemberCompany {
  int status;
  int totalData;
  List<Member> member;

  MemberCompany({
    this.status,
    this.totalData,
    this.member,
  });

  factory MemberCompany.fromJson(Map<String, dynamic> json) => MemberCompany(
    status: json["status"],
    totalData: json["Total_Data"],
    member: List<Member>.from(json["Message"].map((x) => Member.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "Total_Data": totalData,
    "Message": List<dynamic>.from(member.map((x) => x.toJson())),
  };
}

class Member {
  String ceId;
  String companyId;
  String userId;
  String userName;
  String duty;
  String timeStamp;

  Member({
    this.ceId,
    this.companyId,
    this.userId,
    this.userName,
    this.duty,
    this.timeStamp,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
    ceId: json["CE_ID"],
    companyId: json["Company_ID"],
    userId: json["User_ID"],
    userName: json['UserName'],
    duty: json["Duty"],
    timeStamp: json["TimeStamp"],
  );

  Map<String, dynamic> toJson() => {
    "CE_ID": ceId,
    "Company_ID": companyId,
    "User_ID": userId,
    "UserName": userName,
    "Duty": duty,
    "TimeStamp": timeStamp,
  };
}

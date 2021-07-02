// To parse this JSON data, do
//
//     final company = companyFromJson(jsonString);

import 'dart:convert';

Company companyFromJson(String str) => Company.fromJson(json.decode(str));

String companyToJson(Company data) => json.encode(data.toJson());

class Company {
  int status;
  int totalData;
  List<ItemCompany> itemCompany;

  Company({
    this.status,
    this.totalData,
    this.itemCompany,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    status: json["status"],
    totalData: json["Total_Data"],
    itemCompany: List<ItemCompany>.from(json["Message"].map((x) => ItemCompany.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "Total_Data": totalData,
    "Message": List<dynamic>.from(itemCompany.map((x) => x.toJson())),
  };
}

class ItemCompany {
  String companyId;
  String name;
  int age;
  String adderss;
  String provinces;
  String amphurs;
  String districts;
  String zipCode;
  String description;
  String img;
  String owner;
  int confirm;
  String timestamp;
  String duty;
  int isCompany;

  ItemCompany({
    this.companyId,
    this.name,
    this.age,
    this.adderss,
    this.provinces,
    this.amphurs,
    this.districts,
    this.zipCode,
    this.description,
    this.img,
    this.owner,
    this.confirm,
    this.timestamp,
    this.duty,
    this.isCompany
  });

  factory ItemCompany.fromJson(Map<String, dynamic> json) => ItemCompany(
    companyId: json["Company_ID"],
    name: json["Name"],
    age: json["Age"],
    adderss: json["Adderss"],
    provinces: json["Provinces"],
    amphurs: json["Amphurs"],
    districts: json["Districts"],
    zipCode: json["ZipCode"],
    description: json["Description"],
    img: json["Img"],
    owner: json["Owner"],
    confirm: json["Confirm"],
    timestamp: json["Timestamp"],
    duty: json["Duty"],
    isCompany: json["IsCompany"]
  );

  Map<String, dynamic> toJson() => {
    "Company_ID": companyId,
    "Name": name,
    "Age": age,
    "Adderss": adderss,
    "Provinces": provinces,
    "Amphurs": amphurs,
    "Districts": districts,
    "ZipCode": zipCode,
    "Description": description,
    "Img": img,
    "Owner": owner,
    "Confirm": confirm,
    "Timestamp": timestamp,
    "Duty": duty,
    "IsCompany": isCompany
  };
}

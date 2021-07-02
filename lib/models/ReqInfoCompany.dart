// To parse this JSON data, do
//
//     final reqInfoCompany = reqInfoCompanyFromJson(jsonString);

import 'dart:convert';

ReqInfoCompany reqInfoCompanyFromJson(String str) => ReqInfoCompany.fromJson(json.decode(str));

String reqInfoCompanyToJson(ReqInfoCompany data) => json.encode(data.toJson());

class ReqInfoCompany {
  String companyId;

  ReqInfoCompany({
    this.companyId,
  });

  factory ReqInfoCompany.fromJson(Map<String, dynamic> json) => ReqInfoCompany(
    companyId: json["Company_ID"],
  );

  Map<String, dynamic> toJson() => {
    "Company_ID": companyId,
  };
}

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:techsmate/models/Company.dart';
import 'package:techsmate/models/ReqCompany.dart';
import 'package:http/http.dart' as http;
import 'package:techsmate/models/ReqInfoCompany.dart';

class ConfigMember extends StatefulWidget {
  final ItemCompany company;
 const ConfigMember({Key key, this.company}) : super(key: key);

  @override
  _ConfigMemberState createState() => _ConfigMemberState();
}

class _ConfigMemberState extends State<ConfigMember> {

  Future<Company> _CompanyData(BuildContext context, String Company_ID) async {
    Company getJson;
    var reqInfoCompany = ReqInfoCompany();
    reqInfoCompany.companyId = Company_ID;
    String jsonReq = reqInfoCompanyToJson(reqInfoCompany);
    print(jsonReq);
    try {
      var response = await http.post('http://178.128.56.0:5000/Company/Info',
          body: jsonReq,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});
      print('ConnectingCompany');
      if (response.statusCode == 200) {
        print('ConnectedCompany');
        getJson = Company.fromJson(jsonDecode(response.body.toString()));
        print(getJson.totalData);
      }
    } catch (e) {
      print(e);
    } finally {
      http.Client().close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center();
  }
}
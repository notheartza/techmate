import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:techsmate/models/Company.dart';
import 'package:techsmate/models/Login.dart';
import 'package:techsmate/models/MemberCompany.dart';
import 'package:techsmate/models/ReqCompany.dart';
import 'package:http/http.dart' as http;
import 'package:techsmate/models/ReqInfoCompany.dart';

class CompanyMember extends StatefulWidget {
  final ItemCompany company;
  final User users;

  const CompanyMember({Key key, this.company, this.users}) : super(key: key);

  @override
  _CompanyMemberState createState() => _CompanyMemberState();
}

class _CompanyMemberState extends State<CompanyMember> {
  MemberCompany getData;
  List<Member> memberView;
  var img = 'http://178.128.56.0/Image/Profile.png';
  var placeholder = 'Img/ImgUser.png';

  Future<MemberCompany> _CompanyData(
      BuildContext context, String Company_ID) async {
    MemberCompany getJson;
    var reqInfoCompany = ReqInfoCompany();
    reqInfoCompany.companyId = Company_ID;
    String jsonReq = reqInfoCompanyToJson(reqInfoCompany);
    print(jsonReq);
    try {
      var response = await http.post('http://178.128.56.0:5000/Company/Info',
          body: jsonReq,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});
      print('ConnectingCompany');
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('ConnectedCompany');
        getJson = MemberCompany.fromJson(jsonDecode(response.body.toString()));
        print(getJson.totalData);
      }
    } catch (e) {
      print(e);
    } finally {
      http.Client().close();
    }
    return getJson;
  }

  @override
  Widget build(BuildContext context) {
    ItemCompany company = widget.company;
    User users = widget.users;
    print("User_ID " + users.userId);
    print("Company_ID " + company.companyId);
    return SafeArea(
        child: FutureBuilder(
      future: _CompanyData(context, company.companyId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          this.getData = snapshot.data;
          this.memberView = getData.member;
          return ListView.builder(
              shrinkWrap: true,
              itemCount: memberView.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print(memberView.elementAt(index).userId);
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: FadeInImage.assetNetwork(
                                  placeholder: placeholder,
                                  image: img,
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      memberView.elementAt(index).userName,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(memberView.elementAt(index).duty)
                                  ],
                                ),
                              )
                            ],
                          ),
                          (memberView.elementAt(index).userId != users.userId)
                              ? Row(
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(Icons.chat),
                                          color: Colors.blueAccent,
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/ChatView-Page',
                                                arguments: {
                                                  'User': users.userId,
                                                  'Contact': memberView.elementAt(index).userId,
                                                  'nameContact': memberView.elementAt(index).userName
                                                });
                                          },
                                        )
                                      ],
                                    )
                                  ],
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ),
                );
              });
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}

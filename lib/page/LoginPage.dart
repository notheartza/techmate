import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techsmate/models/Login.dart';
import 'package:techsmate/models/ReqLogin.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  String Status;
  int Check;
  var _UserNameController = TextEditingController();
  var _PassWordController = TextEditingController();
  Login JsonLogin;
  User Users;
  final FocusNode _ageFocus = FocusNode();
  final FocusNode _UserFocus = FocusNode();
  final FocusNode _PasswordFocus = FocusNode();

  _fieldFocusChange(BuildContext context,FocusNode currentFocus, FocusNode nextFocus){
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Tech's Mate"),
      ),*/
      body: Container(
        child: Center(
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            shrinkWrap: true,
            children: <Widget>[
              Image.asset(
                'Img/Logo.png',
                width: MediaQuery.of(context).size.width * 0.50,
                height: MediaQuery.of(context).size.width * 0.50,
              ),
              Container(
                  child: Center(
                      child: (Check == 1 && Check != null && Status != null)
                          ? Text(
                              Status,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.redAccent),
                            )
                          : Container())),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 10),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 18, height: 2.0),
                  textAlign: TextAlign.start,
                  focusNode: _UserFocus,
                  onFieldSubmitted: (term){
                   _fieldFocusChange(context, _UserFocus, _PasswordFocus);
                  },
                  decoration: InputDecoration(
                      labelText: 'UserName',
                      hintText: 'ผู้ใช้งาน',
                      labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: SizedBox(
                          height: 2,
                          child: Image.asset('Img/user.png'),
                        ),
                      )),
                  controller: _UserNameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(fontSize: 18, height: 2.0),
                  textAlign: TextAlign.start,
                  obscureText: true,
                  focusNode: _PasswordFocus,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'รหัสผ่าน',
                      labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: SizedBox(
                          height: 2,
                          child: Image.asset('Img/key.png'),
                        ),
                      )),
                  controller: _PassWordController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                        child: Text('Login'),
                        onPressed: () async {
                          print('This is Login');
                          var reqLogin = ReqLogin();
                          if (_UserNameController.text != "" &&
                              _PassWordController.text != "") {
                            reqLogin.userName = _UserNameController.text;
                            reqLogin.passWord = _PassWordController.text;
                            String jsonReq = reqLoginToJson(reqLogin);
                            print(jsonReq);
                            var response = await http.post(
                                'http://178.128.56.0:5000/Login',
                                body: jsonReq,
                                headers: {
                                  HttpHeaders.contentTypeHeader:
                                      'application/json'
                                });
                            setState(() {
                              if (response.statusCode == 200) {
                                JsonLogin = Login.fromJson(
                                    jsonDecode(response.body.toString()));
                                print(JsonLogin.totalData);
                                if (JsonLogin.totalData > 0) {
                                  Users = User.fromJson(
                                      JsonLogin.user.single.toJson());
                                  print(Users.email);
                                  Check = 0;
                                  Navigator.pushNamed(context, '/Home-Page',arguments: Users);
                                } else {
                                  Status =
                                      "คุณกรอกชื่อผู้ใช้หรือรหัสผ่านผิดกรุณาลองใหม่";
                                  Check = 1;
                                }
                              } else {
                                Status =
                                    "คุณกรอกชื่อผู้ใช้หรือรหัสผ่านผิดกรุณาลองใหม่";
                                Check = 1;
                              }
                            });
                          } else {
                            setState(() {
                              Status =
                                  "คุณไม่ได้กรอกชื่อผู้ใช้หรือรหัสผ่านกรุณาลองใหม่";
                              Check = 1;
                            });
                          }
                        }),
                    RaisedButton(
                      child: Text('Register'),
                      onPressed: () {
                        print('This is Register');
                        setState(() {
                          Check = 1;
                        });
                      },
                    )
                  ],
                ),
              ),
              Center(
                child: Text('2020 \u00a9 Weerawut Banleu'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//6C:7C:0A:62:F4:D6:40:75:11:3F:E8:02:1F:88:59:BD:36:39:EF:82
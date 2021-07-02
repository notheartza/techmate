import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loadany/loadany.dart';
import 'package:techsmate/models/Company.dart';
import 'package:http/http.dart' as http;
import 'package:techsmate/models/UserModel.dart';
import 'package:techsmate/models/Login.dart';
import 'package:techsmate/models/ReqCompany.dart';

class CompanyPage extends StatefulWidget {
final User data;
const CompanyPage({Key key, this.data}): super(key: key);

  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  Company getData;
  List<ItemCompany> CompanyView;



  Future<Company> _CompanyData(BuildContext context, String User_ID) async {
    Company getJson;
    var reqCompany = ReqCompany();
    reqCompany.userId = User_ID;
    String jsonReq = reqCompanyToJson(reqCompany);
    print(jsonReq);
    try{
      var response = await http.post(
          'http://178.128.56.0:5000/Company',
          body: jsonReq,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});
      print('ConnectingCompany');
      if (response.statusCode == 200) {
        print('ConnectedCompany');
        getJson = Company.fromJson(jsonDecode(response.body.toString()));
        print(getJson.totalData);
      }
    }catch(e){
      print(e);
    }finally{
      http.Client().close();
    }
    
    return getJson;
  }

  @override
  Widget build(BuildContext context) {
    User users = widget.data;
    print(users.userId);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print("push");
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: _CompanyData(context, users.userId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              this.getData = snapshot.data;
              this.CompanyView = getData.itemCompany;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: CompanyView.length,
                  itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    print(CompanyView.elementAt(index).name);
                    Navigator.pushNamed(context, '/HomeCompany-Page', arguments: {'User' : users,'Company' : CompanyView.elementAt(index)});
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("ชื่อบริษัท : ${CompanyView.elementAt(index).name}", style: TextStyle(fontSize: 16),),
                              Text("หน้าที่ : ${CompanyView.elementAt(index).duty}",style: TextStyle(fontSize: 16),),
                              Text("รหัสพนักงาน : ${CompanyView.elementAt(index).companyId}",style: TextStyle(fontSize: 16),)
                            ],
                          ),
                          (CompanyView.elementAt(index).isCompany==1)?
                            (CompanyView.elementAt(index).confirm==1) ?
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(Icons.beenhere, color: Colors.green,)
                              ],
                            ) : Container():
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.business_center, color: Colors.brown,)
                            ],
                          )
                        ],

                      ),
                    ),
                  ),
                );
              });
            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),);
  }

}
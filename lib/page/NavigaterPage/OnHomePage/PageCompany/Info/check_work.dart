import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

enum ConfirmAction{CANCEL, ACCEPT}
class CheckWork extends StatefulWidget {
  CheckWork({Key key}) : super(key: key);

  @override
  _CheckWorkState createState() => _CheckWorkState();
}

class _CheckWorkState extends State<CheckWork> {
final format = DateFormat("yyyy-MM-DD HH:mm");


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, '/NewWork-Page');
      },
    child: Icon(Icons.add),
    backgroundColor: Colors.blueAccent,
        ),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'ตรวจสอบงานที่1',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('โดย: UName12(เลขาธิการ)'),
                          Text('วันที่ 5 มีนาคม 2563 - 7 มีนาคม 2563'),
                        ],
                      ),
                    )),
              ),
              GestureDetector(
                onTap: () {},
                child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'ตรวจสอบงานที่2',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('โดย: UName8(IT Support)'),
                          Text('วันที่ 5 มีนาคม 2563 - 7 มีนาคม 2563'),
                        ],
                      ),
                    )),
              ),
              GestureDetector(
                onTap: () {},
                child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'ตรวจสอบงานที่3',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('โดย: UName10(เจ้าหน้าที่การเงิน)'),
                          Text('วันที่ 5 มีนาคม 2563 - 7 มีนาคม 2563'),
                        ],
                      ),
                    )),
              ),
              GestureDetector(
                onTap: () {},
                child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'ตรวจสอบงานที่4',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text('โดย: UName2(Designer)'),
                              Text('วันที่ 5 มีนาคม 2563 - 7 มีนาคม 2563'),
                            ],
                          ),
                          Icon(
                            Icons.done,
                            color: Colors.green,
                          )
                        ],
                      ),
                    )),
              ),
              GestureDetector(
                onTap: () {},
                child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'ตรวจสอบงานที่5',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text('โดย: UName3(Analyst)'),
                              Text('วันที่ 5 มีนาคม 2563 - 7 มีนาคม 2563'),
                            ],
                          ),
                          Icon(
                            Icons.done,
                            color: Colors.green,
                          )
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      );
  }
}
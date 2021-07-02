import 'package:flutter/material.dart';

class WorkMeeting extends StatefulWidget {
  WorkMeeting({Key key}) : super(key: key);

  @override
  _WorkMeetingState createState() => _WorkMeetingState();
}

class _WorkMeetingState extends State<WorkMeeting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
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
                            'ประชุมงานที่1',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('เรื่อง: การคัดเลือพนักงาน',style: TextStyle(fontSize: 16),),
                          Text('สถานที่: ห้องประชุมที่1'),
                          Text('เวลา: 13.30 น.'),
                          Text('วันที่ 5 มีนาคม 2563'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text('สถานะ : จัดเตรียมสถานที่'),
                              Row(
                                children: <Widget>[
                                  Text('รอจัดประชุม '),
                                  Icon(
                                    Icons.brightness_1,
                                    size: 12,
                                    color: Colors.orange,
                                  )
                                ],
                              ),

                        ],
                      )
                      /*Icon(
                        Icons.done,
                        color: Colors.green,
                      )*/
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
                            'ประชุมงานที่2',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('เรื่อง: การเสนองานลูกค้า',style: TextStyle(fontSize: 16),),
                          Text('สถานที่: ห้องประชุมที่2'),
                          Text('เวลา: 13.30 น.'),
                          Text('วันที่ 1 มีนาคม 2563'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text('สถานะ : จัดประชุมแล้ว'),
                          Row(
                            children: <Widget>[
                              Text('เข้าร่วมแล้ว '),
                              Icon(
                                Icons.done,
                                color: Colors.green,
                              )
                            ],
                          ),

                        ],
                      )

                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class AdvisorPage extends StatefulWidget {
  AdvisorPage({Key key}) : super(key: key);

  @override
  _AdvisorPageState createState() => _AdvisorPageState();
}

class _AdvisorPageState extends State<AdvisorPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            ListTile(title: Text('ที่ปรึกษาของคุณ: '),),
            ListTile(
              title: Text("บริษัท มารีพรีเซ็น จำกัด"),
              subtitle: Text("ชำนาญ: ความปลอดภัย"),
              trailing: FlatButton(
                  onPressed: () {
                    print("ติดต่อ");
                  },
                  child: Text(
                    "ติดต่อ",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blueAccent),
                  )),
            ),
            ListTile(
              title: Text("บริษัท เมริก"),
              subtitle: Text("ชำนาญ: สถิติ"),
              trailing: FlatButton(
                  onPressed: () {
                    print("ติดต่อ");
                  },
                  child: Text(
                    "ติดต่อ",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blueAccent),
                  )),
            ),
            ListTile(title: Text('ที่ปรึกษาอื่นๆ: '),),
            ListTile(
              title: Text("บริษัท มารีพรีเซ็น จำกัด"),
              subtitle: Text("ชำนาญ: ความปลอดภัย"),
              trailing: FlatButton(
                  onPressed: () {
                    print("สมัคร");
                  },
                  child: Text(
                    "สมัคร",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blueAccent),
                  )),
            ),
            ListTile(
              title: Text("บริษัท เมริก"),
              subtitle: Text("ชำนาญ: สถิติ"),
              trailing: FlatButton(
                  onPressed: () {
                    print("สมัคร");
                  },
                  child: Text(
                    "สมัคร",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blueAccent),
                  )),
            )
          ],
        ));
  }
}

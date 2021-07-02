import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class NewWork extends StatefulWidget {
  NewWork({Key key}) : super(key: key);

  

  @override
  _NewWorkState createState() => _NewWorkState();
}

class _NewWorkState extends State<NewWork> {
  final format = DateFormat('dd MMMM yyyy');
  List<String> _checked = ["A", "B"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เพิ่มงาน'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 10,right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 18, height: 2.0),
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'หัวข้องาน',
                    hintText: 'ชื่องาน',
                    labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 10,
              ),
              Text('เริ่มต้น'),
                DateTimeField(
                  format: format,
                  onShowPicker: (context, currentValue) async {

                    return initializeDateFormatting('th').then((format){
                     return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                    });
                  },
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 10,
                ),
                Text('สิ้นสุด'),
                DateTimeField(
                  format: format,
                  onShowPicker: (context, currentValue) async {
                    return initializeDateFormatting('th').then((format){
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                    });
                  },
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 10,
                ),
                TextFormField(
                  minLines: 5,
                  maxLines: 10,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 16, height: 2.0),
                  textAlign: TextAlign.start,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'รายละเอียดงาน',
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.grey)
                    ),
                    labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 10,
                ),
                CheckboxGroup(
                  labels: <String>[
                    'ถึงทุกคน',
                    'กำหนดเอง'
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10,bottom: 20),
                  color: Colors.grey,
                  width: MediaQuery.of(context).size.width,
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("ตกลง"), onPressed: () {},
                    ),
                    RaisedButton(
                      child: Text("ยกเลิก"), onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
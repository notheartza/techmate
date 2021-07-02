import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnalysisPage extends StatefulWidget {
  AnalysisPage({Key key}) : super(key: key);

  @override
  _AnalysisPageState createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {

 final List<TypeUseChart> chartData = [
    TypeUseChart(21.65, 'คอมพิวเตอร์'),
    TypeUseChart(68.12, 'โทรศัพท์'),
    TypeUseChart(34.68, 'แท็บเล็ต'),
    TypeUseChart(48.56, 'สมาร์ตวอทซ์'),
    TypeUseChart(11.65, 'อื่นๆ')
  ];


   Widget _PropleUseChart(String value){
     if(value=='เริ่มต้น'){
       return SfCartesianChart(
         title: ChartTitle(text: 'ยอดผู้ใช้แอปพลิเคชันในแต่ละปี'),
         legend: Legend(
             borderColor: Colors.blueAccent,
             borderWidth: 2,
             isVisible: true,
             position: LegendPosition.bottom),
         tooltipBehavior: TooltipBehavior(enable: true),
         primaryXAxis: CategoryAxis(
             labelRotation: 90
         ),
         series: <ChartSeries<PrepleData, String>>[
           StackedLineSeries<PrepleData, String>(
             dataSource: <PrepleData>[
               PrepleData(18365, '2010'),
               PrepleData(25365, '2011'),
               PrepleData(32630, '2012'),
               PrepleData(30467, '2013'),
               PrepleData(45600, '2014'),
               PrepleData(62435, '2015'),
               PrepleData(61523, '2016'),
               PrepleData(59658, '2017'),
               PrepleData(95751, '2018'),
               PrepleData(123535, '2019'),
               PrepleData(168957, '2020')
             ],
             xValueMapper: (PrepleData preple, _)=> preple.year,
             yValueMapper: (PrepleData preple, _)=> preple.Preple,
             dataLabelSettings: DataLabelSettings(isVisible: true),
             legendItemText: 'จำนวคน',
           )
         ],
       );
     }else {
       return SfCartesianChart(
         plotAreaBackgroundColor:  Colors.white,
         title: ChartTitle(text: 'ยอดผู้ใช้ในแต่ละช่วงอายุ'),
         legend: Legend(
             borderColor: Colors.blueAccent,
             borderWidth: 2,
             isVisible: true,
             position: LegendPosition.bottom),
         tooltipBehavior: TooltipBehavior(enable: true),
         primaryXAxis: CategoryAxis(
             labelRotation: 90
         ),
         series: <ChartSeries<AgeToUse, String>>[
           StackedLineSeries<AgeToUse, String>(
             dataSource: <AgeToUse>[
               AgeToUse(1250, '9 ปี'),
               AgeToUse(2200, '10 ปี'),
               AgeToUse(1150, '11 ปี'),
               AgeToUse(968, '12 ปี'),
               AgeToUse(784, '13 ปี'),
               AgeToUse(2657, '14 ปี'),
               AgeToUse(4569, '15 ปี'),
               AgeToUse(4735, '16 ปี'),
               AgeToUse(6978, '17 ปี'),
               AgeToUse(5127, '18 ปี'),

             ],
             xValueMapper: (AgeToUse age, _)=> age.age,
             yValueMapper: (AgeToUse age, _)=> age.amount,
             dataLabelSettings: DataLabelSettings(isVisible: true),
             legendItemText: 'จำนวคน',
           )
         ],
       );
     }

 }

 String dropdownValue = 'เริ่มต้น';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(width: 15,height: 1,),
                  DropdownButton<String>(
                    value: dropdownValue,
                    onChanged: (String value) {
                      setState(() {
                        dropdownValue = value;
                      });
                    },
                    items: <String>[
                      'เริ่มต้น','บริษัท มารีพรีเซ็น จำกัด','บริษัท เมริก'
                    ].map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value));
                    }).toList(),

                  ),
                ],
              ),
              _PropleUseChart(dropdownValue)

            ],
          ),
        ),
      ),
    );
  }
}



class PrepleData{
  PrepleData(this.Preple, this.year);

  final int Preple;
  final String year;
}

class AgeToUse{
  AgeToUse(this.amount, this.age);
  final int amount;
  final String age;
}

class TypeUseChart{
  TypeUseChart(this.x, this.y );
  final double x;
  final String y;
}
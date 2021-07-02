
import 'package:flutter/material.dart';

class ShopListPage extends StatefulWidget {
  @override
  _ShopListPageState createState() => _ShopListPageState();
}

class _ShopListPageState extends State<ShopListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    Padding(
      padding: const EdgeInsets.only(top: 10,left: 10,right: 10),

        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('สินค้า: ' ,style: TextStyle(fontSize: 20),),
                   Container(
                     margin: const EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 2,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 10),
                    child: ListView(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      children: <Widget>[
                        ListTile(
                          onTap: (){
                            print('Cart');
                          },
                          leading: Icon(Icons.shopping_cart),
                          title: Text('รถเข็น',style: TextStyle(fontSize: 16),),
                        ),
                        ListTile(
                          onTap: (){
                            print('Payed');
                          },
                          leading: Icon(Icons.payment),
                          title: Text('ชำระเงิน/สถานะ',style: TextStyle(fontSize: 16)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('ห้องสมุด: ' ,style: TextStyle(fontSize: 20),),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 2,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 10),
                    child: ListView(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      children: <Widget>[
                        ListTile(
                          onTap: (){
                            print('Cart');
                          },
                          leading: Icon(Icons.devices),
                          title: Text('อุปกรณ์',style: TextStyle(fontSize: 16),),
                        ),
                        ListTile(
                          onTap: (){
                            print('Payed');
                          },
                          leading: Icon(Icons.shop),
                          title: Text('ซอฟแวร์',style: TextStyle(fontSize: 16)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('การเคลมสินค้า: ' ,style: TextStyle(fontSize: 20),),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 2,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 10),
                    child: ListView(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      children: <Widget>[
                        ListTile(
                          onTap: (){
                            print('Cart');
                          },
                          leading: Icon(Icons.build),
                          title: Text('เช็คสินค้า',style: TextStyle(fontSize: 16),),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )

          ],
        ),

    ));
  }

}
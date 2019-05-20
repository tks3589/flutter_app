import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AsyncPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _AsyncPageState();
  }

}

class _AsyncPageState extends State<AsyncPage> {
  SharedPreferences sf;
  int sv;
  @override
  void initState() {
    super.initState();
    //funcA();
    initData();

    /*funcB();
    funcC();
    funcD();*/
  }
   initData() async{
       sf = await SharedPreferences.getInstance();
       setState(() {
         sv = sf.getInt('value');
         if(sv == null)
           sv = 0;
       });

  }
  void funcB() async{
    sleep(Duration(seconds: 3));
    print('B ${DateTime.now()}');
  }
  void funcC() async{
    sleep(Duration(seconds: 3));
    print('C ${DateTime.now()}');
  }
  void funcD() async{
    sleep(Duration(seconds: 3));
    print('D ${DateTime.now()}');
  }

  Future<String> getData() async{
    sleep(Duration(seconds: 1));
    return "ABC";
  }
  void funcA() async{
    print('${DateTime.now()}');
    String str = await getData();
    Future<String> futureStr = getData();

    print('$str ${DateTime.now()}');
    futureStr.then((String value){
      print('$value ${DateTime.now()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('異步'),
      ),
      body:Center(
        child: Column(
          children: <Widget>[
            Text("current value:$sv"),
            RaisedButton(
              child:Text('click'),
              onPressed: (){
                setState((){
                  sv = sv+1;
                  sf.setInt("value", sv);
                });
              }
            )
          ],
        )

      ),

    );
  }
}
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
  }
   initData() async{
       sf = await SharedPreferences.getInstance();
       setState(() {
         sv = sf.getInt('value');
         if(sv == null)
           sv = 0;
       });

  }

  Future<String> getData() async{
    return "ABC";
  }
  void funcA() async{

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
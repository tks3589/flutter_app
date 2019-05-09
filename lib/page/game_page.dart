import 'package:flutter/material.dart';
import 'dart:async';
import 'result_page.dart';

class GamingPageRoute extends MaterialPageRoute{
  GamingPageRoute() : super(builder:(contenxt){
    return NewPage();
  });
}

class NewPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _NewPageState();
  }

}

class _NewPageState extends State<NewPage>{
  int _count = 0;
  int second = 5;
  int milliseconds = 5000;


  @override
  void initState() {
    Timer.periodic(Duration(milliseconds: 100), (timer){
      if(milliseconds==0){
        timer.cancel();
        Navigator.pop(context);
        Navigator.push(context, ResultPage(_count));
      }else{
        setState(() {
          milliseconds-=100;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text('click game')
      ),
      body:SizedBox.expand(
        child: FlatButton(
          child:Column(
            children: <Widget>[
              Text('${milliseconds/1000.0}'),
              Text('$_count')
            ],
          ) ,
          onPressed: (){
                setState(() {
                  _count++;
                });
            },

        )
      )
    );
  }
}
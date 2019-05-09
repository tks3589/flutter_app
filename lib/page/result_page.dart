import 'package:flutter/material.dart';
import 'dart:convert';

class ResultPage extends MaterialPageRoute{
  ResultPage(result) : super(builder:(contenxt){
    return NewPage(result);
  });
}

class NewPage extends StatefulWidget{
  
  final int result;
  const NewPage(this.result);

  @override
  State<StatefulWidget> createState() {
    return _NewPageState();
  }

}

class _NewPageState extends State<NewPage>{

  String str = '{\"name\":\"aaron\"}';
  //String str = "";
  Map<String,dynamic> json ;

  @override
  void initState() {
    json = jsonDecode(str);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text('result')
      ),
      body:Center(
        child:Text('${widget.result}_____Json: ${json['name']}')
      )
      /*body:ListView(
        children: <Widget>[
          _notification(json['notification'][0])
        ],
      )*/
    );
  }

  Widget _notification(Map<String,dynamic> notification){
    return Column(
      children: <Widget>[
        Text('${notification['info']['title']}')
      ],
    );
  }

}
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class HttpPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HttpPage();
  }

}

class _HttpPage extends State<HttpPage> {
  String str = '' ;
  Map<String,dynamic> json;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP_TESTER'),
      ),
      //body:Text(str)
      //body:Text(json.toString())
      body: ListView(children: _renderWidgets())
    );
  }

  void getData() async{
    var url = 'https://kuas.grd.idv.tw:14769/latest/notifications/1';
    Response response = await Dio().get(url);
    setState(() {
      str = 'a';
      json = response.data;
    });
  }
   _renderWidgets() {
    List<Widget> widgets = [];
    if (str != '') {
      for (var i in json['notification']) {
        widgets.add(_notification(i));
      }
    }
    return widgets;
  }

  Widget _notification(Map<String, dynamic> notification) {
    return Column(
      children: <Widget>[
        SizedBox(height: 4),
        Padding(
          child: Text(
            '${notification['info']['title']}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          padding: EdgeInsets.all(8),
        ),
        Row(
          children: <Widget>[
            SizedBox(width: 8),
            Expanded(
              child: Text(
                '${notification['info']['department']}',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                ),
              ),
            ),
            Text(
              '${notification['info']['date']}',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 16,
              ),
            ),
            SizedBox(width: 8),
          ],
        ),
        SizedBox(height: 8),
        Container(
          color: Colors.grey,
          height: 0.5,
        ),
      ],
    );
  }
  
  















  /*void getData() async{
    var url = 'https://google.com';
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body.runtimeType}');
    setState(() {
      str = response.body;
    });
  }

  void getData() async{
    var url = 'https://google.com';
    var response = await Dio().get(url);
    setState(() {
      str = response.data;
    });
  }   */

}


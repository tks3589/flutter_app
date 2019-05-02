import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(BMI());

class BMI extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI計算機',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: StatefulWidgetPage(),
      home: Tester()
    );
  }

}
class Tester extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //return Text('啊啊啊啊啊啊啊');

    return Scaffold(
      appBar: AppBar(
        title: Text('Tester'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Text('a'),
            Text('b'),
            Text('c')
          ],
        ),
      )

        //body: Text('fefefefe'),
    );
  }

}
class StatefulWidgetPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _StatefulWidgetPageState();
  }

}

class _StatefulWidgetPageState extends State<StatefulWidget>{
  var height = TextEditingController();
  var weight = TextEditingController();
  var result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI計算機'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              controller: height,
              obscureText: false,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
              hintText: '請輸入身高(cm)',
              labelText: '身高',
              ),
            ),
            TextField(
              controller: weight,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '請輸入體重(kg)',
                labelText: '體重',
              ),
            ),
            Text(
              '您的BMI為 $result',
            ),
            RaisedButton(
              child: Text('計算'),
              onPressed: (){
                setState(() {
                  result = double.parse(weight.text) /
                      pow(double.parse(height.text) / 100.0, 2);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
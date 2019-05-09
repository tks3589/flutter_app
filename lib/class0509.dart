import 'package:flutter/material.dart';
import 'page/game_page.dart';

void main() => runApp(TTT());

class TTT extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tester0509',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Tester()
    );
  }
}


















class Tester extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Tester();
  }

}

class _Tester extends State<Tester> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tester0509'),
      ),
      body:Center(
        child: Column(
          children: <Widget>[
            Text('click to start game'),
            RaisedButton(
                child:Text('click'),
                onPressed: (){
                  Navigator.push(context, GamingPageRoute());
                },
            )

          ],
        )
      )
    );
  }
}
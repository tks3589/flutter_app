import 'package:flutter/material.dart';
import 'page/async_page.dart';
import 'page/http_page.dart';

void main() => runApp(TTT());

class TTT extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Async0516',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: Tester()
        //home: AsyncPage()
        home: HttpPage()
    );
  }
}
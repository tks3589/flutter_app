import 'package:flutter/material.dart';
import 'page/http_page_0523.dart';
import 'page/dio_page_0523.dart';

void main() => runApp(TTT());

class TTT extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Async0523',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: HttpPage()
        home: DioSamplePage()
    );
  }
}
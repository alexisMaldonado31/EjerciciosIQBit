import 'package:flutter/material.dart';
import 'package:iqbit_frontend/pages/MainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'main',
      routes: {'main': (BuildContext context) => MainPage()},
    );
  }
}

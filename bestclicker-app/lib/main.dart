import 'package:bestclicker_app/ipchoice.dart';
import 'package:flutter/material.dart';
import 'globalvars.dart';
import 'ipchoice.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'best Clicker | 1.0',
      theme: ThemeData(
        scaffoldBackgroundColor: bg_color,
        primaryColor: bg_color,
        fontFamily: 'Sono',
        textTheme: Theme.of(context).textTheme.apply(bodyColor: primary_color),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ConnectScreen(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_kullanimi/sqflite_kullanimi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quick SMS',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        accentColor: Colors.pinkAccent,
        backgroundColor: Colors.white10,
      ),
      home: SqfliteKullanimi(),
    );
  }
}

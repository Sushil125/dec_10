import 'package:dec_10/screen/classwork.dart';
import 'package:dec_10/screen/mybutton.dart';
import 'package:dec_10/screen/myform.dart';
import 'package:dec_10/screen/mytext.dart';
import 'package:dec_10/screen/stfl.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyForm(),
    );
  }
}

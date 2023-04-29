import 'package:flutter/material.dart';
import 'package:flutter_app/screens/calculator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const Calculator(),
    );
  }
}

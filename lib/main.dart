import 'package:cred/Categories.dart';
import 'package:cred/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HOMe(content: Category('Welcome', 'Mint', 'Darshan Nere')),
    );
  }
}

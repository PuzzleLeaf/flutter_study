import 'package:domain_driven/injection.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Container(
            child: Text('Hello world'),
          ),
        ),
      )
    );
  }
}

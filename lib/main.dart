import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import 'ContactList.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Contacts'),
          ),
          body: ContactList()),
    );
  }
}

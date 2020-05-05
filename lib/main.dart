import 'package:flutter/material.dart';

final String appTitle = 'Libellum';

class Book {
  Book({this.title, this.pageCount});

  final String title;
  final int pageCount;
}

void main() {
  runApp(MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          child: Text('Hello world!'),
        ),
      )));
}

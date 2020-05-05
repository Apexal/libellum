import 'package:flutter/material.dart';

class BooksListRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Books'),
      ),
      body: Container(padding: EdgeInsets.all(30)),
    );
  }
}

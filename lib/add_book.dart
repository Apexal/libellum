import 'package:flutter/material.dart';

class AddBookRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Book'),
      ),
      body: Container(
        padding: EdgeInsets.all(30)
      ),
    );
  }
}
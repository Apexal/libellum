import 'package:flutter/material.dart';

import './add_book.dart';

final String appTitle = 'Libellum';

class Book {
  Book({this.title, this.pageCount});

  final String title;
  final int pageCount;
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddBookRoute()),
            );
          },
          child: Text('Add Book'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: 'Add new book',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddBookRoute()),
            );
          },),
    );
  }
}

void main() {
  runApp(MaterialApp(title: appTitle, home: Home()));
}

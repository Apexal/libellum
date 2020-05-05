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
      bottomNavigationBar:
          BottomNavigationBar(
            onTap: (index) {
              if (index == 2) {
                Navigator.pushNamed(context, '/add_book');
              }
            },
          items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books),
          title: Text('Your Books'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          title: Text('Add Book'),
        ),
      ]),
    );
  }
}

void main() {
  runApp(MaterialApp(title: appTitle, initialRoute: '/', routes: {
    '/': (context) => Home(),
    '/add_book': (context) => AddBookRoute()
  }));
}

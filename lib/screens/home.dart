import 'package:flutter/material.dart';

import 'package:libellum/main.dart';
import 'package:libellum/screens/add_book.dart';

class HomeRoute extends StatelessWidget {
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
      floatingActionButton: Builder(builder: (BuildContext context) {
        return FloatingActionButton(
          onPressed: () async {
            final bookDetails =
                await Navigator.pushNamed(context, '/books/add');
            Scaffold.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text("$bookDetails")));
          },
          child: Icon(Icons.add),
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            if (index == 1) {
              Navigator.pushNamed(context, '/books');
            } else if (index == 2) {
              Navigator.pushNamed(context, '/books/add');
            }
          },
          currentIndex: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              title: Text('Your Books'),
            ),
          ]),
    );
  }
}

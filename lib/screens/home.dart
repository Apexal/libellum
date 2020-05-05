import 'package:flutter/material.dart';
import 'package:libellum/common/book_card.dart';
import 'package:libellum/common/bottom_bar.dart';

import 'package:libellum/main.dart';
import 'package:libellum/models/books.dart';
import 'package:provider/provider.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              Consumer<BooksModel>(
                builder: (context, bookList, child) {
                  if (bookList.books.length == 0) {
                    return Text('No books!');
                  }
                  return BookCard(book: bookList.books.first);
                },
              )
            ],
          )),
      floatingActionButton: Builder(builder: (BuildContext context) {
        return FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/books/add');
          },
          child: Icon(Icons.add),
        );
      }),
      bottomNavigationBar: MyBottomNavbar(currentIndex: 0),
    );
  }
}

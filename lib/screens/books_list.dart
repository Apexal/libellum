import 'package:flutter/material.dart';

import 'package:libellum/models/book.dart';

final int s = 12;

final List<Book> books = [Book(title: 'Flutter Dev', pageCount: 100), Book(title: 'Firebase Dev', pageCount: 140)];

class BooksListRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Books'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          var book = books.elementAt(index);

          return ListTile(
            onTap: () {
              Scaffold.of(context).showSnackBar(SnackBar(content: Text('Tapped ${book.title}')));
            },
            title: Text(book.title,)
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:libellum/models/books.dart';

class BookCard extends StatelessWidget {
  BookCard({this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset('assets/images/book_cover.jpg'),
          Text(book.title),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Text('Read'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}

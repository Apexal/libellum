import 'package:flutter/material.dart';
import 'package:libellum/models/books.dart';

class BookCard extends StatelessWidget {
  BookCard({this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    var w600 = FontWeight.w600;
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset('assets/images/book_cover.jpg'),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(book.title, style: TextStyle(fontSize: 30, fontWeight: w600),),
          ),
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

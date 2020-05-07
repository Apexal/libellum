import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:libellum/models/books.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  static AppModel of(BuildContext context) => ScopedModel.of<AppModel>(context);

  List<Book> _books = [];

  UnmodifiableListView<Book> get books => UnmodifiableListView<Book>(_books);
  
  Book addBook(String title, int pageCount) {
    var newBook = Book(id: _books.length + 1, title: title, pageCount: pageCount);

    _books.add(newBook);

    return newBook;
  }
}
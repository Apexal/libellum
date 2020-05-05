import 'dart:collection';

import 'package:flutter/foundation.dart';

class Book {
  Book({this.title, this.pageCount});

  final String title;
  final int pageCount;
}

class BooksModel extends ChangeNotifier {
  final List<Book> _books = [];

  UnmodifiableListView<Book> get books => UnmodifiableListView(_books);

  void add (Book book) {
    _books.add(book);
    notifyListeners();
  }
}
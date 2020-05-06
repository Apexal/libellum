import 'dart:collection';

import 'package:flutter/foundation.dart';

class Book {
  Book({this.id, this.title, this.pageCount});

  final int id;
  final String title;
  final int pageCount;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'pageCount': pageCount,
    };
  }

  @override
  String toString() {
    return 'Book{id: $id, title: $title, pageCount: $pageCount}';
  }
}

class BooksModel extends ChangeNotifier {
  final List<Book> _books = [];

  UnmodifiableListView<Book> get books => UnmodifiableListView(_books);

  void add (Book book) {
    _books.add(book);
    notifyListeners();
  }
}
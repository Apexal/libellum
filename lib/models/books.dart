import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'package:libellum/models/model.dart';

class Book extends Model {
  Book({this.id, this.title, this.pageCount});

  int id;
  String title;
  int pageCount;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'pageCount': pageCount,
    };
  }

  static Book fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      title: map['title'],
      pageCount: map['pageCount']
    );
  }

  @override
  String toString() {
    return 'Book{id: $id, title: $title, pageCount: $pageCount}';
  }
}

class BooksModel extends ChangeNotifier {
  final List<Book> _books = [];

  UnmodifiableListView<Book> get books => UnmodifiableListView(_books);

  void add(Book book) {
    _books.add(book);
    notifyListeners();
  }
}

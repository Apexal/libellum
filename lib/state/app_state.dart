import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:libellum/models/books.dart';
import 'package:libellum/services/db.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  AppModel() {
    DB.init()
      .then((_) => DB.query("books"))
      .then((maps) {
        _books = maps.map(Book.fromMap).toList();

        notifyListeners();
      });    
  }

  static AppModel of(BuildContext context) => ScopedModel.of<AppModel>(context);

  List<Book> _books = [];

  UnmodifiableListView<Book> get books => UnmodifiableListView<Book>(_books);
  
  Future<Book> addBook(String title, int pageCount) async {
    
    var newBook = Book(id: _books.length + 1, title: title, pageCount: pageCount);
    await DB.insert('books', newBook);

    _books.add(newBook);
    
    notifyListeners();

    return newBook;
  }

  void removeBook(Book book) async {
    await DB.delete("books", book);
    _books.remove(book);
    notifyListeners();
  }
}
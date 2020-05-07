import 'dart:collection';

import 'package:libellum/models/books.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  List<Book> _books;

  UnmodifiableListView<Book> get books => UnmodifiableListView<Book>(_books);
  
  void addBook() {
    print("ADDING BOOK");
  }
}
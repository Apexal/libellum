import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'package:libellum/models/db_model.dart';

class Book extends DBModel {
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
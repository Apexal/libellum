import 'package:libellum/models/db_model.dart';

class Book extends DBModel {
  Book({this.id, this.title, this.pageCount, this.addedDate, this.progress});

  final int id;
  final String title;
  final String addedDate;
  final int pageCount;
  final int progress;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'addedDate': addedDate,
      'pageCount': pageCount,
      'progress': progress,
    };
  }

  static Book fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      title: map['title'],
      addedDate: map['addedDate'],
      pageCount: map['pageCount'],
      progress: map['progress']
    );
  }

  @override
  String toString() {
    return 'Book{id: $id, title: $title, pageCount: $pageCount}';
  }
}
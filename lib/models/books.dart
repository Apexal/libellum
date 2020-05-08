import 'package:intl/intl.dart';
import 'package:libellum/models/db_model.dart';

class Book extends DBModel {
  Book({this.id, this.title, this.progress = 0, this.pageCount, this.addedDate, this.updatedDate}) {
    this.addedDate = this.updatedDate = _dateFormat.format(DateTime.now());
  }
  
  final _dateFormat = DateFormat('yyyy-MM-dd');
  final int id;
  String title;
  String addedDate;
  String updatedDate;
  int pageCount;
  int progress;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'addedDate': addedDate,
      'updatedDate': updatedDate,
      'pageCount': pageCount,
      'progress': progress,
    };
  }

  static Book fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      title: map['title'],
      addedDate: map['addedDate'],
      updatedDate: map['updatedDate'],
      pageCount: map['pageCount'],
      progress: map['progress']
    );
  }

  @override
  String toString() {
    return 'Book{id: $id, title: $title, pageCount: $pageCount}';
  }
}
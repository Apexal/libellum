import 'package:libellum/models/db_model.dart';

import 'package:sqflite/sqflite.dart';

abstract class DB {
  static Database _db;

  static int get _version => 1;

  static Future<void> init() async {
    // Prevent running more than once
    if (_db != null) {
      return;
    }

    // Read database
    try {
      String dbPath = await getDatabasesPath() + 'libellum';
      _db = await openDatabase(dbPath, version: _version, onCreate: onCreate);
    } catch (err) {
      print(err);
    }
  }

  static void onCreate(Database db, int version) async {
    // Create tables
    await db.execute('''
    create table books ( 
      id integer primary key autoincrement, 
      title text not null,
      pageCount integer not null
    )''');
  }

  static Future<List<Map<String, dynamic>>> query(String table) async =>
      _db.query(table);

  static Future<int> insert(String table, DBModel model) async =>
      await _db.insert(table, model.toMap());

  static Future<int> update(String table, DBModel model) async => await _db
      .update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);

  static Future<int> delete(String table, DBModel model) async =>
      await _db.delete(table, where: 'id = ?', whereArgs: [model.id]);
}

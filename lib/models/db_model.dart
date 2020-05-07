/// All models should inherit this class.
abstract class DBModel {
  int id;

  static fromMap() {}
  toMap() {}
}
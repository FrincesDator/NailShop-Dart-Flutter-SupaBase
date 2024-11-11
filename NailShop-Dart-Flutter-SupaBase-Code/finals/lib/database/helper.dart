import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const String dbName = 'reviews.db';
  static const String tableName = 'reviews';

  Future<Database> initializeDatabase() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, dbName),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $tableName(id INTEGER PRIMARY KEY, review TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertReview(String review) async {
    final Database db = await initializeDatabase();
    await db.insert(tableName, {'review': review});
  }

  Future<List<Map<String, dynamic>>> getReviews() async {
    final Database db = await initializeDatabase();
    return db.query(tableName);
  }
}

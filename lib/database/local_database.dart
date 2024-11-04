import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final LocalDatabase instance = LocalDatabase();

  late Database database;

  Future<void> createDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/my_database.db';

    database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT NOT NULL, email TEXT UNIQUE NOT NULL, password TEXT NOT NULL, createdAt INTEGER NOT NULL)',
        );
        await db.execute(
          'CREATE TABLE todos (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, userId INTEGER NOT NULL, title TEXT NOT NULL, description TEXT, isCompleted INTEGER NOT NULL, createdAt INTEGER NOT NULL, updatedAt INTEGER, deletedAt INTEGER)',
        );
      },
    );
  }

  Future<void> closeDatabase() async {
    await database.close();
  }
}

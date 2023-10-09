import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/SignupModel.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  factory DatabaseHelper() {
    _instance ??= DatabaseHelper._();
    return _instance!;
  }
  DatabaseHelper._();

  Future<Database> get database async {
    _database ??= await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'your_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT,
            email TEXT,
            mobile TEXT,
            gender TEXT,
            password TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertUser(User user) async {
    print("insertUser");
    final db = await initDatabase();
    var res = await db.insert('users', user.toMap());
    print('res $res');
    return res;
  }

  Future<User?> getUser(String username) async {
    final db = await database;
    final result = await db.query('users', where: 'username = ?', whereArgs: [username]);
    return result.isNotEmpty ? User.fromMap(result.first) : null;
  }
}

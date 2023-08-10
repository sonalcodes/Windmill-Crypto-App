import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:windmill_crypto_app/models/home/crypto_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'my_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE my_table (
        uniqueId INTEGER PRIMARY KEY,
        name TEXT,
        id INTEGER,
        symbol TEXT
        
      )
    ''');
  }

  // Implement methods for CRUD operations
  Future<int> insertData(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert('my_table',
        {"name": row["name"], "id": row["id"], "symbol": row["symbol"]},
        conflictAlgorithm: ConflictAlgorithm.replace);
    /* return await db.insert('my_table', {
      "name":row["name"],
      "id":row["id"],
    });*/
  }

  Future<List<CryptoModelData>> getData() async {
    final db = await _initDatabase();
    final List<Map<String, dynamic>> maps = await db.query('my_table');
    return List.generate(maps.length, (i) {
      return CryptoModelData(
          id: maps[i]['id'], name: maps[i]['name'], symbol: maps[i]['symbol']);
    });
  }

  Future<void> delete(int id) async {
    final db = await _initDatabase();
    db.delete('my_table', where: 'id = ?', whereArgs: [id]);
  }

  Future<CryptoModelData?> getSelectedId(int id) async {
    final db = await _initDatabase();
    List<Map> maps =
        await db.query('my_table', where: 'id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return CryptoModelData.fromJson(maps.first as Map<String, dynamic>);
    }
    return null;
  }
// ... other methods
}

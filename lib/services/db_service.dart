import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DbService {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = p.join(dbPath, 'smartshop.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE favorites (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            price TEXT NOT NULL,
            imagePath TEXT NOT NULL
          )
        ''');
      },
    );
  }
}

// Insérer un étudiant
Future<void> insertEtudiant(Map<String, dynamic> e) async {
  final db = await initDB();
  await db.insert('etudiants', e);
}

// 1) Ajouter un produit aux favoris

Future<int> insertFavorite({
  required String name,
  required String price,
  required String imagePath,
}) async {
  final db = await initDB();
  return db.insert('favorites', {
    'name': name,
    'price': price,
    'imagePath': imagePath,
  }, conflictAlgorithm: ConflictAlgorithm.replace);
}

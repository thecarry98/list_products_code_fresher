import 'package:path/path.dart';
import 'package:list_products_code_fresher/model/product.dart';
import 'package:sqflite/sqflite.dart';

class ProductsDatabase {
  static final ProductsDatabase instance = ProductsDatabase._init();

  static Database? _database;

  ProductsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    // final boolType = 'BOOLEAN NOT NULL';
    final doubleType = 'DOUBLE NOT NULL';

    await db.execute('''
CREATE TABLE $tableNotes ( 
  ${ProductFields.id} $idType, 
  ${ProductFields.title} $textType,
  ${ProductFields.linkImage} $textType,
  ${ProductFields.price} $doubleType,
  ${ProductFields.description} $textType,
  )
''');
  }

  Future<Product> create(Product note) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableNotes, note.toJson());
    return note.copy(id: id);
  }

  Future<Product> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableNotes,
      columns: ProductFields.values,
      where: '${ProductFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Product.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Product>> readAllNotes() async {
    final db = await instance.database;

    // final orderBy = '${ProductFields.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableNotes);

    return result.map((json) => Product.fromJson(json)).toList();
  }

  Future<int> update(Product note) async {
    final db = await instance.database;

    return db.update(
      tableNotes,
      note.toJson(),
      where: '${ProductFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableNotes,
      where: '${ProductFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}

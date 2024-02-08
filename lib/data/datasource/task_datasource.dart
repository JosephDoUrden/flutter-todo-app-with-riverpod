import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app_riverpod/data/data.dart';
import 'package:todo_app_riverpod/utils/utils.dart';

class TaskDatasource {
  static final TaskDatasource _instance = TaskDatasource._();
  factory TaskDatasource() => _instance;

  TaskDatasource._() {
    // init
    _initDB();
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, DBKeys.dbName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${DBKeys.dbTable}(
        ${DBKeys.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${DBKeys.titleColumn} TEXT,
        ${DBKeys.categoryColumn} TEXT,
        ${DBKeys.dateColumn} TEXT,
        ${DBKeys.timeColumn} TEXT,
        ${DBKeys.descriptionColumn} TEXT,
        ${DBKeys.isDoneColumn} INTEGER
      )
    ''');
  }

  Future<int> createTask(Task task) async {
    final db = await database;
    return db.transaction(
      (txn) async {
        return await txn.insert(
          DBKeys.dbTable,
          task.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      },
    );
  }

  Future<int> updateTask(Task task) async {
    final db = await database;
    return db.transaction(
      (txn) async {
        return await txn.update(
          DBKeys.dbTable,
          task.toJson(),
          where: 'id = ?',
          whereArgs: [task.id],
        );
      },
    );
  }

  Future<int> deleteTask(Task task) async {
    final db = await database;
    return db.transaction(
      (txn) async {
        return await txn.delete(
          DBKeys.dbTable,
          where: 'id = ?',
          whereArgs: [task.id],
        );
      },
    );
  }

  Future<List<Task>> getTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(DBKeys.dbTable);
    return List.generate(maps.length, (index) {
      return Task.fromJson(maps[index]);
    });
  }
}

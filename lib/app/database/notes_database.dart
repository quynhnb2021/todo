import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/app/models/task_model.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('tasks.db');
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
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableTasks ( 
  ${TaskFields.id} $idType, 
  ${TaskFields.status} $boolType,
  ${TaskFields.title} $textType,
  ${TaskFields.time} $textType
  )
''');
  }

  Future<Task> create(Task task) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableTasks, task.toJson());
    return task.copy(id: id);
  }

  Future<Task> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableTasks,
      columns: TaskFields.values,
      where: '${TaskFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Task.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Task>> readAllNotes() async {
    final db = await instance.database;

    final orderBy = '${TaskFields.time} ASC';

    final result = await db.query(tableTasks, orderBy: orderBy);

    return result.map((json) => Task.fromJson(json)).toList();
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}

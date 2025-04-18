import "../model/Note.dart";
import "package:sqflite/sqflite.dart";
import 'package:path/path.dart';

/*
  instance: Singleton pattern đảm bảo chỉ có một instance của DatabaseHelper
  database: Getter trả về instance của Database, tạo mới nếu chưa tồn tại
  _initDB: Khởi tạo database với đường dẫn cụ thể
  _createDB: Tạo các bảng khi database được tạo lần đầu
  close: Đóng kết nối database
   */


class NoteDatabaseHelper {
  // tạo instance của database
  static final NoteDatabaseHelper instance = NoteDatabaseHelper._init();
  static Database? _database;

  NoteDatabaseHelper._init();

  //get database
  Future<Database> get database async {
    if (_database != null) return _database!;
    //create and return new database
    _database = await _initDB('app_database.db');
    return _database!;
  }
  //create db if not exist
  Future<Database> _initDB(String filePath) async {
    //get locate dbpath
    final dbPath = await getDatabasesPath();
    //join dbpath with filename
    final path = join(dbPath, filePath);
    //return database
    return await openDatabase(path, version: 1, onCreate: _createDB); // _call createDB
  }
  // return {
  // 'id': id,
  // 'title': title,
  // 'content': content,
  // 'priority': priority,
  // 'createdAt': createdAt.toIso8601String(),
  // 'modifiedAt': modifiedAt.toIso8601String(),
  // 'tags': tags.join(','),
  // 'color': color,
  // };
  Future _createDB(Database db, int version) async {
    //execute query to create table
    await db.execute('''
        CREATE TABLE notes (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          content TEXT NOT NULL,
          priority INTEGER NOT NULL,
          color TEXT,
          tags TEXT NOT NULL,
          createdAt TEXT NOT NULL,
          modifiedAt TEXT NOT NULL
        )
      ''');

    // Tạo sẵn dữ liệu mẫu | insert seed data
    await _insertSampleData(db);
  }

  // Phương thức chèn dữ liệu mẫu
  Future _insertSampleData(Database db) async {
    // Danh sách dữ liệu mẫu | make a list of Map (object)
    final List<Map<String, dynamic>> sampleNoteData = [
      {
        'title': 'Weekly Meeting Notes',
        'content': 'Discussed project timelines, resource allocation, and next steps.',
        'priority': 1,
        'createdAt': DateTime(1990, 5, 15).toIso8601String(),
        'modifiedAt': DateTime(1990, 5, 15).toIso8601String(),
        'tags': 'work,meeting,notes',
        'color': '#0000FF', // Blue
      },
      {
        'title': 'Grocery List',
        'content': 'Milk, eggs, bread, apples, and chicken.',
        'priority': 2,
        'createdAt': DateTime(1990, 5, 15).toIso8601String(),
        'modifiedAt': DateTime(1990, 5, 15).toIso8601String(),
        'tags': 'personal,shopping',
        'color': '#008000', // Green
      }

    ];

    for (final noteDate in sampleNoteData) {
      //insert user form map to db
      await db.insert('notes', noteDate);
    }
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  // Create - Thêm user mới
  Future<int> createNote(Note note) async {
    //get database instance
    final db = await instance.database;

    //insert user that converted to map to db
    return await db.insert('notes', note.toMap());
  }

  // Read - Đọc tất cả users
  Future<List<Note>> getAllNotes(String selectedTag) async {
    //get database instance
    final db = await instance.database;
    //query all users -> : select * from 'users'
    final result = await db.query('notes', orderBy: "priority DESC",
        where: selectedTag.isNotEmpty ? 'tags LIKE ?' : null, whereArgs: selectedTag.isNotEmpty ? ['%$selectedTag%'] : null);

    return result.map((map) => Note.fromMap(map)).toList();
  }

  // Read - Đọc user theo id
  Future<Note?> getNoteById(int id) async {
    final db = await instance.database;
    //query single users -> : select * from 'users' where id = [id]
    final maps = await db.query('notes', where: 'id = ?', whereArgs: [id]);

    //if maps get from db is not empty or more than 1, return the first element
    if (maps.isNotEmpty) {
      return Note.fromMap(maps.first);
    }
    //if maps is empty, return null
    return null;
  }

  // Update - Cập nhật user
  Future<int> updateNote(Note note) async {
    final db = await instance.database;
    print(note);
    //update user that converted to map to db -> : update 'users' set [user.toMap()] where id = [id]
    return await db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  // Delete - Xoá user
  Future<int> deleteNote(int id) async {
    final db = await instance.database;
    //delete user where id = [id]
    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  // Delete - Xoá tất cả users
  Future<int> deleteAllNotes() async {
    final db = await instance.database;
    //delete all users -> : delete from 'users'
    return await db.delete('notes');
  }

  // Đếm số lượng users
  Future<int> countUsers() async {
    final db = await instance.database;
    //execute query to count users -> : select count(*) from 'users'
    final result = await db.rawQuery('SELECT COUNT(*) FROM notes');
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<List<String>> getAllTags() async {
    final db = await instance.database;

    // Truy vấn tất cả các tags
    final result = await db.query('notes', columns: ['tags']);

    // Tách các tags và gộp chúng lại vào một danh sách
    final List<String> allTags = [];
    for (var row in result) {
      if (row['tags'] != null) {
        allTags.addAll((row['tags'] as String).split(','));
      }
    }

    // Loại bỏ các tags trùng lặp
    return allTags.toSet().toList();
  }

}


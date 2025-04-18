import "../model/User.dart";
import "package:sqflite/sqflite.dart";
import 'package:path/path.dart';

/*
  instance: Singleton pattern đảm bảo chỉ có một instance của DatabaseHelper
  database: Getter trả về instance của Database, tạo mới nếu chưa tồn tại
  _initDB: Khởi tạo database với đường dẫn cụ thể
  _createDB: Tạo các bảng khi database được tạo lần đầu
  close: Đóng kết nối database
   */


class UserDatabaseHelper {
  // tạo instance của database
  static final UserDatabaseHelper instance = UserDatabaseHelper._init();
  static Database? _database;

  UserDatabaseHelper._init();

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

  Future _createDB(Database db, int version) async {
    //execute query to create table
    await db.execute('''
        CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          email TEXT NOT NULL,
          phone TEXT NOT NULL,
          avatar TEXT,
          dateOfBirth TEXT NOT NULL
        )
      ''');

    // Tạo sẵn dữ liệu mẫu | insert seed data
    await _insertSampleData(db);
  }

  // Phương thức chèn dữ liệu mẫu
  Future _insertSampleData(Database db) async {
    // Danh sách dữ liệu mẫu | make a list of Map (object)
    final List<Map<String, dynamic>> sampleUsers = [
      {
        'name': 'Nguyễn Văn An',
        'email': 'nguyenvanan@gmail.com',
        'phone': '0901234567',
        'avatar': null,
        'dateOfBirth': DateTime(1990, 5, 15).toIso8601String(),
      },
      {
        'name': 'Trần Thị Bình',
        'email': 'tranthibinh@gmail.com',
        'phone': '0912345678',
        'avatar': null,
        'dateOfBirth': DateTime(1992, 8, 21).toIso8601String(),
      },
      {
        'name': 'Lê Văn Cường',
        'email': 'levancuong@gmail.com',
        'phone': '0923456789',
        'avatar': null,
        'dateOfBirth': DateTime(1988, 3, 10).toIso8601String(),
      },
      {
        'name': 'Phạm Thị Dung',
        'email': 'phamthidung@gmail.com',
        'phone': '0934567890',
        'avatar': null,
        'dateOfBirth': DateTime(1995, 11, 25).toIso8601String(),
      },
      {
        'name': 'Hoàng Văn Emm',
        'email': 'hoangvanemm@gmail.com',
        'phone': '0945678901',
        'avatar': null,
        'dateOfBirth': DateTime(1993, 7, 8).toIso8601String(),
      },
    ];

    // Chèn từng người dùng vào cơ sở dữ liệu
    for (final userData in sampleUsers) {
      //insert user form map to db
      await db.insert('users', userData);
    }
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  // Create - Thêm user mới
  Future<int> createUser(User user) async {
    //get database instance
    final db = await instance.database;

    //insert user that converted to map to db
    return await db.insert('users', user.toMap());
  }

  // Read - Đọc tất cả users
  Future<List<User>> getAllUsers() async {
    //get database instance
    final db = await instance.database;
    //query all users -> : select * from 'users'
    final result = await db.query('users');

    return result.map((map) => User.fromMap(map)).toList();
  }

  // Read - Đọc user theo id
  Future<User?> getUserById(int id) async {
    final db = await instance.database;
    //query single users -> : select * from 'users' where id = [id]
    final maps = await db.query('users', where: 'id = ?', whereArgs: [id]);
    //if maps get from db is not empty or more than 1, return the first element
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    //if maps is empty, return null
    return null;
  }

  // Update - Cập nhật user
  Future<int> updateUser(User user) async {
    final db = await instance.database;

    //update user that converted to map to db -> : update 'users' set [user.toMap()] where id = [id]
    return await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  // Delete - Xoá user
  Future<int> deleteUser(int id) async {
    final db = await instance.database;
    //delete user where id = [id]
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  // Delete - Xoá tất cả users
  Future<int> deleteAllUsers() async {
    final db = await instance.database;
    //delete all users -> : delete from 'users'
    return await db.delete('users');
  }

  // Đếm số lượng users
  Future<int> countUsers() async {
    final db = await instance.database;
    //execute query to count users -> : select count(*) from 'users'
    final result = await db.rawQuery('SELECT COUNT(*) FROM users');
    return Sqflite.firstIntValue(result) ?? 0;
  }
}


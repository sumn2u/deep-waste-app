import 'dart:io';
import 'package:deep_waste/models/Category.dart';
import 'package:deep_waste/models/Item.dart';
import 'package:deep_waste/models/User.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  static const _dbName = "deepwaste.db";

  DatabaseManager._privateConstructor();
  static final DatabaseManager instance =
      DatabaseManager._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _dbName);

    var dbExists = await databaseExists(path);

    if (!dbExists) {
      print("db not exist");
      print("Creating new copy from asset");

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets", _dbName));
      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );

      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }

    return openDatabase(path);
  }

  Future<List<Category>> getCategories() async {
    final db = await instance.database;
    final categories = await db.query('Category');

    return categories.isNotEmpty
        ? categories.map((c) => Category.fromMap(c)).toList()
        : <Category>[];
  }

  Future<List<Item>> getItems() async {
    final db = await instance.database;
    final items = await db.query('Item');

    return items.isNotEmpty
        ? items.map((c) => Item.fromMap(c)).toList()
        : <Item>[];
  }

  Future<User?> getUser() async {
    final db = await instance.database;
    final user = await db.query('User');

    if (user.isEmpty) return null;
    return User.fromMap(user.first);
  }

  Future<int> insertUser(User profile) async {
    final db = await instance.database;
    return await db.insert("User", profile.toMap());
  }

  Future<int> deleteUser(int userId) async {
    final db = await instance.database;
    return await db.delete(
      "User",
      where: "id = ?",
      whereArgs: [userId],
    );
  }

  Future<int> updateItem(Item item) async {
    final db = await instance.database;
    return await db.update(
      "Item",
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }
}
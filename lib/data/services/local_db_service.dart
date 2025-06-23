import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static const _databaseName = "flutDB.db";
  static const _databaseVersion = 1;
  static const taskTable = 'Task_table';

  static const id = 1;

  // make this a singleton class
  DatabaseService._privateConstructor();
  static final DatabaseService instance = DatabaseService._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
     CREATE TABLE $taskTable (
     task_id INTEGER PRIMARY KEY AUTOINCREMENT,
      task_title TEXT NOT NULL,
      task_description TEXT,
      task_start_date TEXT,
      task_due_date TEXT,
      task_type TEXT,
      task_priority TEXT,
      task_tags TEXT,
      task_attachment TEXT,
      isSync INTEGER DEFAULT 0
     )
    ''');
  }

  /*
CREATE
READ
UPDATE
DELETE

Task_table 

task_id
task_title
task_description
task_start_date
task_due_date
task_type
task_priority
task_tags
task_attachment

  await db.execute('''
          CREATE TABLE $table (
            id INTEGER PRIMARY KEY, $stCol1 TEXT,$stCol2 TEXT
           )
          ''');
   */

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    return await db!.query(taskTable);
  }

  Future<List<Map<String, dynamic>>> queryFilterRows() async {
    Database? db = await instance.database;
    return await db!.rawQuery("select * from $taskTable where stCol2='111'");
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  // Future<int> update(Map<String, dynamic> row) async {
  //   Database db = await instance.database;
  //   int id = row[columnId];
  //   return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  // }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database? db = await instance.database;
    return await db!.delete(taskTable);
  }
}

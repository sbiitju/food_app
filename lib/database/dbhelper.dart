import 'dart:async';
import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/person.dart';

class DBHelper {
  Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "test.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Employee(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)");
    print("Created tables");
  }

  void saveEmployee(Person person) async {
    var dbClient = await db;
    await dbClient?.insert("Employee", person.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Person>> getPerson() async {
    var dbClient = await db;
    List<Map> list = await dbClient!.rawQuery('SELECT * FROM Employee');
    List<Person> person = [];
    for (int i = 0; i < list.length; i++) {
      person.add(Person(list[i]["id"], list[i]["name"], list[i]["age"]));
    }
    print(person.length);
    return person;
  }
// void test(){
//   if(false ^ true){
//
//   }
// }
}

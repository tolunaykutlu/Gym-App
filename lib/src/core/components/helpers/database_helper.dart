import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' show join;

class DatabaseServiceHelper {
  static const table = "userInfo";
  static const columnName = "name";
  static const columnTime = "time";
  static const columnId = "id";

  //singleton class
  DatabaseServiceHelper._privateConst();
  static final DatabaseServiceHelper instance =
      DatabaseServiceHelper._privateConst();

// only have a single app-wide reference to the database
  static late Database _database;
  Future<Database> get database async {
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

// this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "users");
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

// SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute(''' 
  CREATE TABLE $table($columnId INTEGER PRIMARY KEY,$columnName TEXT,$columnTime INTEGER)''');

    await db.rawInsert(
        'INSERT INTO $table($columnName,$columnTime) VALUES("BOB", 22)');
    await db.rawInsert(
        'INSERT INTO $table($columnName,$columnTime) VALUES("aqdq", 23)');
  }

//insert
  Future<int> insert(Map<String, dynamic> row) async {
    return await _database.insert(table, row);
  }

//all query
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    return await _database.query(table);
  }

  /* _query() async {
    Database db = await DatabaseServiceHelper.instance.database;

    List<Map> result = await db.query(DatabaseServiceHelper.table);
    for (var element in result) {
      print(element);
    }
  }

  _queryAll() async {
    // get a reference to the database
    Database db = await DatabaseServiceHelper.instance.database;

    // get single row
    List<String> columnsToSelect = [
      DatabaseServiceHelper.columnId,
      DatabaseServiceHelper.columnName,
      DatabaseServiceHelper.columnTime,
    ];
    String whereString = '${DatabaseServiceHelper.columnId} = ?';
    int rowId = 1;
    List<dynamic> whereArguments = [rowId];
    List<Map> result = await db.query(DatabaseServiceHelper.table,
        columns: columnsToSelect,
        where: whereString,
        whereArgs: whereArguments);

    // print the results
    result.forEach((row) => print(row));
    // {
  } */
}

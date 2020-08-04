import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  //Database name and version
  static final _dbName = "food.db";
  static final _dbVersion = 1;

  //Table name
  static final table = "DealOnSpot";

  //Columns name
  static final dealID = "id";
  static final dealName = "deal";
  static final dealPrice = "price";
  static final category = "category";
  static final itemName = "item";
  static final quantity = "qty";
  static final chooseAny = "any";

  //Database variable
  static Database _db;

  DBHelper._pvtConst();

  static final DBHelper instance = DBHelper._pvtConst();

  Future<Database> get database async {
    if (_db != null) return _db;
    _db = await _initDB();
    return _db;
  }

  _initDB() async {
    Directory documentDir = await getApplicationDocumentsDirectory();
    String path = join(documentDir.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        '''
      CREATE TABLE $table(
        $dealID INTEGER PRIMARY KEY,
        $dealName TEXT NOT NULL,
        $dealPrice INTEGER NOT NULL,
        $category TEXT NOT NULL,
        $itemName TEXT NOT NULL,
        $quantity INTEGER NOT NULL,
        $chooseAny TEXT NOT NULL
      )
      '''
    );
  }

  Future<int> insertRow(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<List<Map<String, dynamic>>> getSpecific(String deal) async {
    Database db = await instance.database;
    var res = await db.rawQuery('SELECT DISTINCT category, qty, any FROM $table WHERE deal = ?', [deal]);
    return res;
  }

  Future<List<Map<String, dynamic>>> getItems(String cat) async {
    Database db = await instance.database;
    var res = await db.rawQuery('SELECT DISTINCT item FROM $table WHERE category = ?', [cat]);
    return res;
  }

  Future<List<Map<String, dynamic>>> getSpecificAll(String deal) async {
    Database db = await instance.database;
    var res = await db.rawQuery('SELECT * FROM $table WHERE deal = ? ', [deal]);
    return res;
  }

  Future<List<Map<String, dynamic>>> getItemList(String deal, String item) async {
    Database db = await instance.database;
    var res = await db.rawQuery('SELECT DISTINCT item any FROM $table WHERE deal = ? AND category = ?', [deal, item]);
    return res;
  }
}
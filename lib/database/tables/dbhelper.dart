import 'package:food_app/database/db_main.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  //Database name and version
//  static final _dbName = "food.db";
//  static final _dbVersion = 1;

  //table1 name
  static final table1 = "DealOnSpot";

  //Columns name of table1
  static final dealID = "id";
  static final dealName = "deal";
  static final dealPrice = "price";
  static final category = "category";
  static final itemName = "item";
  static final quantity = "qty";
  static final chooseAny = "any";

  final mainDbHelper = MainDBHelper.instance;

  static final String tblDealOnSpot = '''CREATE TABLE $table1(
    $dealID INTEGER PRIMARY KEY,
    $dealName TEXT NOT NULL,
    $dealPrice INTEGER NOT NULL,
    $category TEXT NOT NULL,
    $itemName TEXT NOT NULL,
    $quantity INTEGER NOT NULL,
    $chooseAny TEXT NOT NULL
    )''';

  //Database variable
//  static Database _db;

  DBHelper._pvtConst();

  static final DBHelper instance = DBHelper._pvtConst();

//  Future<Database> get database async {
//    if (_db != null) return _db;
//    _db = await _initDB();
//    return _db;
//  }

//  _initDB() async {
//    Directory documentDir = await getApplicationDocumentsDirectory();
//    String path = join(documentDir.path, _dbName);
//    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
//  }

//  Future _onCreate( Database db, int version) async {
//    await db.execute(
//        '''CREATE TABLE $table1(
//    $dealID INTEGER PRIMARY KEY,
//    $dealName TEXT NOT NULL,
//    $dealPrice INTEGER NOT NULL,
//    $category TEXT NOT NULL,
//    $itemName TEXT NOT NULL,
//    $quantity INTEGER NOT NULL,
//    $chooseAny TEXT NOT NULL
//    )'''
//    );
//  }

  Future<int> insertRow(Map<String, dynamic> row) async {
    Database db = await mainDbHelper.database;
    return await db.insert(table1, row);
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    Database db = await mainDbHelper.database;
    return await db.query(table1);
  }

  Future<List<Map<String, dynamic>>> getSpecific(String deal) async {
    Database db = await mainDbHelper.database;
    var res = await db.rawQuery('SELECT DISTINCT category, qty, any FROM $table1 WHERE deal = ?', [deal]);
    return res;
  }

  Future<List<Map<String, dynamic>>> getItems(String cat) async {
    Database db = await mainDbHelper.database;
    var res = await db.rawQuery('SELECT DISTINCT item FROM $table1 WHERE category = ?', [cat]);
    return res;
  }

//  Future<List<Map<String, dynamic>>> getSpecificAll(String deal) async {
//    Database db = await instance.database;
//    var res = await db.rawQuery('SELECT * FROM $table1 WHERE deal = ? ', [deal]);
//    return res;
//  }
//
//  Future<List<Map<String, dynamic>>> getItemList(String deal, String item) async {
//    Database db = await instance.database;
//    var res = await db.rawQuery('SELECT DISTINCT item any FROM $table1 WHERE deal = ? AND category = ?', [deal, item]);
//    return res;
//  }
}
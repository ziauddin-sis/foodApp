import 'dart:io';
import 'package:food_app/database/db_main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TblCompany{

//  static Database _db;

  //Table name
  static final tableName = "company";

//  static final _dbName = "food.db";
//  static final _dbVersion = 1;

  //Columns name of table2
  static final id = "id";
  static final currency = "currency";
  static final timezone = "timezone";
  static final dateFormat = "date_format";
  static final outletId = "outlet_id";
  static final name = "name";
  static final email  = "email";
  static final phone1  = "phone_1";
  static final phone2  = "phone_2";
  static final address  = "address";
  static final status  = "status";
  static final dateAdded  = "date_added";
  static final expiryDate  = "expiry_date";
  static final token  = "token";

  final mainDbHelper = MainDBHelper.instance;

  TblCompany._pvtConst();
//
  static final TblCompany instance = TblCompany._pvtConst();
//
//  Future<Database> get database async {
//    if (_db != null) return _db;
//    _db = await _initDB();
//    return _db;
//  }
//
// //region ABC TABLE
//  _initDB() async {
//    Directory documentDir = await getApplicationDocumentsDirectory();
//    String path = join(documentDir.path, _dbName);
//    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
//  }
//
//  Future _onCreate( Database db, int version) async {
//    await db.execute(
//        '''CREATE TABLE $tableName(
//    $id INTEGER,
//    $currency TEXT,
//    $timezone TEXT,
//    $dateFormat TEXT,
//    $outletId INTEGER,
//    $name TEXT,
//    $email TEXT,
//    $phone1 TEXT,
//    $phone2 TEXT,
//    $address TEXT,
//    $status TEXT,
//    $dateAdded TEXT,
//    $expiryDate TEXT,
//    $token TEXT
//      )'''
//    );
//  }
  //endregion

  static final String tblCompany = '''CREATE TABLE $tableName(
    $id INTEGER,
    $currency TEXT,
    $timezone TEXT,
    $dateFormat TEXT,
    $outletId INTEGER,
    $name TEXT,
    $email TEXT,
    $phone1 TEXT,
    $phone2 TEXT,
    $address TEXT,
    $status TEXT,
    $dateAdded TEXT,
    $expiryDate TEXT,
    $token TEXT 
     )''';

  Future<int> insertCompany(Map<String, dynamic> row) async {
    Database db = await mainDbHelper.database;
    print('Database: $db');
    return await db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> getCompanies() async {
    Database db = await mainDbHelper.database;
    return await db.query(tableName);
  }

}
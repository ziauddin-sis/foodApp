import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TblCompany{

  static Database _db;

  //Table name
  static final tableName = "company";

  static final _dbName = "food.db";
  static final _dbVersion = 1;

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

  TblCompany._pvtConst();

  static final TblCompany instance = TblCompany._pvtConst();

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

  Future _onCreate( Database db, int version) async {
    await db.execute(
        '''CREATE TABLE IF NOT EXIST $tableName(
    $id INTEGER PRIMARY KEY,
    $currency TEXT NOT NULL,
    $timezone TEXT NOT NULL,
    $dateFormat TEXT NOT NULL,
    $outletId INTEGER NOT NULL,
    $name TEXT NOT NULL,
    $email TEXT NOT NULL,
    $phone1 TEXT NOT NULL,
    $phone2 TEXT NOT NULL,
    $address TEXT NOT NULL,
    $status TEXT NOT NULL,
    $dateAdded TEXT NOT NULL
    $expiryDate TEXT NOT NULL
    $token TEXT NOT NULL
    )'''
    );

    Future<int> insertRow(Map<String, dynamic> row) async {
      Database db = await instance.database;
      return await db.insert(tableName, row);
    }

    Future<List<Map<String, dynamic>>> getAll() async {
      Database db = await instance.database;
      return await db.query(tableName);
    }
  }
}
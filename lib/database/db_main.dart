import 'dart:io';
import 'package:food_app/database/dbhelper.dart';
import 'package:food_app/database/tables/tbl_company.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MainDBHelper {

  //Database name and version
  static final _dbName = "food.db";
  static final _dbVersion = 1;

  //Database variable
  static Database _db;

  MainDBHelper._pvtConst();

  static final MainDBHelper instance = MainDBHelper._pvtConst();

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
    await db.execute(TblCompany.tblCompany);
    await db.execute(DBHelper.tblDealOnSpot);
  }
  
}
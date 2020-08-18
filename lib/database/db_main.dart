import 'dart:io';
import 'file:///D:/Flutter/foodApp/lib/database/tables/dbhelper.dart';
import 'package:food_app/database/tables/tbl_categories.dart';
import 'package:food_app/database/tables/tbl_company.dart';
import 'package:food_app/database/tables/tbl_customers.dart';
import 'package:food_app/database/tables/tbl_item_menus.dart';
import 'package:food_app/database/tables/tbl_item_modifiers.dart';
import 'package:food_app/database/tables/tbl_modifiers.dart';
import 'package:food_app/database/tables/tbl_outlet.dart';
import 'package:food_app/database/tables/tbl_tables.dart';
import 'package:food_app/database/tables/tbl_user.dart';
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
    await db.execute(TblOutlet.tblOutlet);
    await db.execute(TblUsers.tblUsers);
    await db.execute(TblTables.tblTables);
    await db.execute(TblCategories.tblCategories);
    await db.execute(TblModifiers.tblModifiers);
    await db.execute(TblItemMenus.tblItemMenus);
    await db.execute(TblItemModifiers.tblItemModifier);
    await db.execute(TblCustomers.tblCustomers);
  }
  
}
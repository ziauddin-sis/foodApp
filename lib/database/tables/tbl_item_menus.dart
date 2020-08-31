import 'package:sqflite/sqflite.dart';

import '../db_main.dart';

class TblItemMenus{

  static final tableName = 'item_menus';

  final mainDbHelper = MainDBHelper.instance;

  TblItemMenus._pvtConst();
  static final TblItemMenus itemMenusInstance = TblItemMenus._pvtConst();

  static final id = 'id';
  static final code = 'code';
  static final name = 'name';
  static final salePrice = 'sale_price';
  static final photo = 'photo';
  static final categoryName = 'category_name';
  static final percentage = 'percentage';

  static final String tblItemMenus = '''
  CREATE TABLE $tableName(
  $id INTEGER,
  $code TEXT,
  $name TEXT,
  $salePrice TEXT,
  $photo INTEGER,
  $categoryName INTEGER,
  $percentage TEXT
  )
  ''';

  Future<int> insertItemMenus (Map<String, dynamic> itm) async{
    Database db = await mainDbHelper.database;
    return await db.insert(tableName, itm);
  }

  Future<List<Map<String, dynamic>>> getItemMenus() async {
    Database db = await mainDbHelper.database;
    return await db.query(tableName);
  }

  Future<List<Map<String, dynamic>>> getSpecificItemMenus(String name) async {
    Database db = await mainDbHelper.database;
    var res = await db.rawQuery('SELECT * FROM $tableName WHERE category_name = ?', [name]);
    return res;
  }
}
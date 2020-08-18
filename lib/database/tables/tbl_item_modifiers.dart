import 'package:sqflite/sqflite.dart';

import '../db_main.dart';

class TblItemModifiers{

  static final tableName = 'item_modifiers';

  final mainDbHelper = MainDBHelper.instance;

  TblItemModifiers._pvtConst();
  static final TblItemModifiers itemModifiersInstance = TblItemModifiers._pvtConst();

  static final id = 'id';
  static final modifierId = 'modifier_id';
  static final foodMenuId = 'food_menu_id';
  static final outletId = 'outlet_id';
  static final userId = 'user_id';
  static final companyId = 'company_id';
  static final name = 'name';
  static final price = 'price';
  static final delStatus = 'del_status';

  static final String tblItemModifier = '''
  CREATE TABLE $tableName(
  $id INTEGER,
  $modifierId INTEGER,
  $foodMenuId INTEGER,
  $outletId INTEGER,
  $userId INTEGER,
  $companyId INTEGER,
  $name TEXT,
  $price TEXT,
  $delStatus TEXT
  )
  ''';

  Future<int> insertItemModifier (Map<String, dynamic> itm) async{
    Database db = await mainDbHelper.database;
    return await db.insert(tableName, itm);
  }

  Future<List<Map<String, dynamic>>> getItemModifier() async {
    Database db = await mainDbHelper.database;
    return await db.query(tableName);
  }
}
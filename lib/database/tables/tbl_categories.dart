import 'package:sqflite/sqflite.dart';

import '../db_main.dart';

class TblCategories{

  static final tableName = 'categories';

  final mainDbHelper = MainDBHelper.instance;

  TblCategories._pvtConst();
  static final TblCategories categoriesInstance = TblCategories._pvtConst();

  static final id = 'id';
  static final categoryName = 'category_name';
  static final description = 'description';
  static final userId = 'user_id';
  static final companyId = 'company_id';
  static final delStatus = 'del_status';

  static final String tblCategories = '''
  CREATE TABLE $tableName(
  $id INTEGER,
  $categoryName TEXT,
  $description TEXT,
  $userId INTEGER,
  $companyId INTEGER,
  $delStatus TEXT
  )
  ''';

  Future<int> insertCategories (Map<String, dynamic> table) async{
    Database db = await mainDbHelper.database;
    return await db.insert(tableName, table);
  }

  Future<List<Map<String, dynamic>>> getCategories() async {
    Database db = await mainDbHelper.database;
    return await db.query(tableName);
  }
}